'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'histogram', (negiService, negiAPI, $interval)->
  link = (scope, element) ->
    margin =
      top: 20
      right: 20
      bottom: 60
      left: 40

    width = 1100 - (margin.left) - (margin.right)
    height = 350 - (margin.top) - (margin.bottom)

    formatPercent = d3.format('s')

    renderHttpHistogram = (data)->
      x = d3.scale
        .ordinal()
        .domain data.map((d) -> d.time)
        .rangeRoundBands([0, width], .1)

      y = d3.scale.linear().range([height, 0])

      xAxis = d3.svg
        .axis()
        .scale x
        .orient 'bottom'
      yAxis = d3.svg
        .axis()
        .scale y
        .orient 'left'
        .tickFormat formatPercent

      tip = d3.tip()
        .attr 'class', 'd3-tip'
        .offset [-10, 0]
        .html((d) ->
          '<strong>count:</strong><span style=\'color:#fff\'>'+d.count+'</span>'
        )

      svg = d3.select element[0]
        .append 'svg'
        .attr 'id', 'http-access-graph'
        .attr 'width', width + margin.left + margin.right
        .attr 'height', height + margin.top + margin.bottom
        .append 'g'
        .attr 'transform', 'translate(' + margin.left + ',' + margin.top + ')'

      svg.call(tip)

      # x.domain data.map((d) -> d.date)
      y.domain [0, d3.max(data, (d) -> d.count)]

      svg.append 'g'
        .attr 'class', 'x axis'
        .attr 'transform', 'translate(0,' + height + ')'
        .call xAxis

      svg.append 'g'
        .attr 'class', 'y axis'
        .call yAxis
        .append 'text'
        .attr 'transform', 'rotate(-90)'
        .attr 'y', 6
        .attr 'dy', '.71em'
        .style 'text-anchor', 'end'
        .text 'Count'

      svg.selectAll '.bar'
        .data data
        .enter()
        .append 'rect'
        .attr 'class', 'bar'
        .attr 'x', (d) -> x(d.time)
        .attr 'width', x.rangeBand()
        .attr 'y', (d) -> y(d.count)
        .attr 'height', (d) -> height - y(d.count)
        .on 'mouseover', tip.show
        .on 'mouseout', tip.hide

      svg.selectAll(".x.axis text")
        .attr("transform", (d)->
          "translate(" + this.getBBox().height * -2 +
            "," + this.getBBox().height + ")rotate(-45)"
        )

    # TODO: refactor later
    # Can we update variable via service?
    updateHttpHistogram = ()->
      negiAPI.resource('httpHistogram').httpHistogram().$promise.then(
        (data)->
          element[0].innerHTML = ''
          renderHttpHistogram(data)

        (error)->
          console.log error
      )
    $interval(updateHttpHistogram, 10000)

  {
    link: link,
    restrict: 'EA'
  }
