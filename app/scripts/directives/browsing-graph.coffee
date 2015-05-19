'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'browsingGraph', ->
  link = (scope, element, attr) ->
    svg = d3.select element[0]
            .append 'svg'
            .attr "width", 800
            .attr "height", 400

    y_axis = do ->
      y = 0
      ->
        y += 45

    nodes = [
      {x: 50, y: y_axis(), r: 10, name: 'http://westlab.ac.keio.jp'},
      {x: 50, y: y_axis(), r: 20, name: 'http://westlab.ac.keio.jp'},
      {x: 50, y: y_axis(), r: 5, name: 'http://westlab.ac.keio.jp'},
      {x: 50, y: y_axis(), r: 10, name: 'http://westlab.ac.keio.jp'},
      {x: 50, y: y_axis(), r: 20, name: 'http://westlab.ac.keio.jp'},
      {x: 50, y: y_axis(), r: 5, name: 'http://westlab.ac.keio.jp'},
      {x: 50, y: y_axis(), r: 20, name: 'http://westlab.ac.keio.jp'},
      {x: 50, y: y_axis(), r: 20, name: 'http://westlab.ac.keio.jp'}
    ]

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
      .attr "transform", (d) -> "translate(" + (d.x + 100 )+ "," + d.y + ")"

  {
    link: link,
    restrict: 'E'
  }
