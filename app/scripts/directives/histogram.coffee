'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'histogram', (negiService)->
  link = (scope, element) ->
    margin =
      top: 40
      right: 20
      bottom: 30
      left: 40
    width = 500 - (margin.left) - (margin.right)
    height = 300 - (margin.top) - (margin.bottom)
    formatPercent = d3.format('s')
    x = d3.scale.ordinal().rangeRoundBands([
      0
      width
    ], .1)
    y = d3.scale.linear().range([
      height
      0
    ])
    xAxis = d3.svg.axis().scale(x).orient('bottom')
    yAxis = d3.svg.axis().scale(y).orient('left').tickFormat(formatPercent)
    tip = d3.tip().attr('class', 'd3-tip').offset([
      -10
      0
    ]).html((d) ->
      '<strong>count:</strong> <span style=\'color:#727272\'>'
      + d.count + '</span>'
    )
    svg = d3.select(element[0]).append('svg')
    .attr('width', width + margin.left + margin.right)
    .attr('height', height + margin.top * 5 + margin.bottom)
    .append('g')
    .attr('transform', 'translate(' + margin.left + ',' + margin.top * 4 + ')')
    type = (d) ->
      d.count = +d.count
      d

    svg.call tip
    data = negiService.Histogram
    x.domain data.map((d) ->
      d.time
    )
    y.domain [
      0
      d3.max(data, (d) ->
        d.count
      )
    ]
    svg.append('g').attr('class', 'x axis')
    .attr('transform', 'translate(0,' + height + ')').call xAxis
    svg.append('g').attr('class', 'y axis').call(yAxis).append('text')
    .attr('transform', 'rotate(-90)').attr('y', 6).attr('dy', '.71em')
    .style('text-anchor', 'end').text 'Count'
    svg.selectAll('.bar').data(data).enter().append('rect')
    .attr('class', 'bar').attr('x', (d) ->
      x d.time
    ).attr('width', x.rangeBand()).attr('y', (d) ->
      y d.count
    ).attr('height', (d) ->
      height - y(d.count)
    ).on('mouseover', tip.show).on 'mouseout', tip.hide
  {
  link: link,
  restrict: 'E'
  }
