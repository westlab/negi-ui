'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.directive 'wordCloud', ->
  link = (scope, element, attr) ->
    data = [
      "Hello"
      "world"
      "normally"
      "you"
      "want"
      "more"
      "words"
      "than"
      "this"]
      .map((d)->
        {text: d, size: 10 + Math.random() * 90}
       )
    fill = d3.scale.category20()


    draw = (words) ->
      d3.select(element[0]).append("svg")
      .attr("width", 790)
      .attr("height", 300)
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
      ).text((d)-> d.text)

    d3.layout.cloud().size([300, 300])
      .words(data)
      .padding(5)
      .rotate(()->  ~~(Math.random() * 2) * 50 )
      .font("Impact")
      .fontSize((d)-> d.size )
      .on("end", draw)
      .start()

  {
    link: link,
    restrict: 'E'
  }
