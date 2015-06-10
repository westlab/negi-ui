'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'wordCloud',(negiAPI, $interval)->
  link = (scope, element, attr) ->
    fill = d3.scale.category20()

    renderWordCloud = (data)->
      draw = (words) ->
        d3.select(element[0]).append("svg")
        .attr("width", 790)
        .attr("height", 430)
        .append("g")
        .attr("transform", "translate(150,150)")
        .selectAll("text")
        .data(words)
        .enter()
        .append("text")
        .style("font-size", (d) -> d.size + "px" )
        .style("font-family", "Impact")
        .style("fill", (d, i) -> fill(i) )
        .attr("text-anchor", "middle")
        .attr("transform", (d) ->
          "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")"
        ).text((d)-> d.name)

      d3.layout.cloud().size([300, 300])
        .words(data)
        .padding(5)
        .rotate(()->  ~~(Math.random() * 2) * 50 )
        .font("Impact")
        .fontSize((d)-> d.size )
        .on("end", draw)
        .start()

    updateWordCloud = ()->
      negiAPI.resource('word').get().$promise.then(
        (data)->
          console.log data
          element[0].innerHTML = ''
          renderWordCloud(data)

        (error)->
          console.log error

      )
    $interval(displayWordCloud, 5000)

  {
    link: link,
    restrict: 'E'
  }
