'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'browsingGraph', (negiAPI, $rootScope)->
  link = (scope, element, attr) ->


    renderBrowsingGraph = (data)->
      y_axis = do ->
        y = 0
        ->
          y += 45

      limit = 30
      nodes = data.map((d)->
        d.x = 50
        d.y = y_axis()
        d.name = d.title
        r =  Math.log10(d.browsing_time) * 10
        d.r = if r > limit then limit else r
        d
      )

      svg = d3.select element[0]
              .append 'svg'
              .attr "width", 1000
              .attr "height", 1000

      links = []
      for i in [0..nodes.length - 2]
        links.push {source: nodes[i], target: nodes[i + 1]}

      svg.selectAll ".line"
        .data links
        .enter()
        .append "line"
        .attr "x1", (d) -> d.source.x
        .attr "y1", (d) -> d.source.y
        .attr "x2", (d) -> d.target.x
        .attr "y2", (d) -> d.target.y
        .attr "marker-end", "url(#triangle)"
        .style "stroke", "#393b79"

      node = svg.selectAll(".nodes")
        .data nodes
        .enter()
        .append "g"

      node.append "circle"
        .attr "cx", (d) -> d.x
        .attr "cy", (d) -> d.y
        .attr "r", (d) -> d.r
        .attr "fill", "#448AFF"
        .attr "stroke", "#6b6ecf"
        .attr "class", 'node'
        .attr "stroke-width", 3

      node.append "text"
        .attr "dx", 20
        .attr "dy", ".35em"
        .text (d) -> d.name
        .attr "transform", (d) -> "translate(" + (d.x + 30 )+ "," + (d.y - 5) + ")"

      node.append "text"
        .attr "dx", 20
        .attr "dy", ".35em"
        .attr "fill", "#b5b5b5"
        .text (d) -> d.url
        .attr "transform", (d) -> "translate(" + (d.x + 40 )+ "," + (d.y + 12) + ")"

    dispalyBrowsingGraph = (ip)->
      scope.isBrowsingGraphLoading = true
      negiAPI.resource('http_record').getByIp({ip:ip},
        (data)->
          element[0].innerHTML = ''
          scope.srcIP = ip
          scope.loadBrowsingGraph = false
          renderBrowsingGraph(data)

        (error)->
          console.log error
      )
    $rootScope.displayBrowsingGraph = dispalyBrowsingGraph

  {
    link: link,
    restrict: 'E'
  }
