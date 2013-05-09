# window.app makes a global variable called 'app'. The window does this.
# this is so we can access this from anywhere. if it's not global, you can't get to it
window.app =
  ready: ->
    # console.log('i am ready')
    app.draw_arc()
  # color_body: ->
  #   d3.select('body')
  #     .style('background-color', 'magenta')




  draw_arc: ->
    vis = d3.select('body').append('svg')
    pi = Math.PI

    arc = d3.svg.arc()
      .innerRadius(110)
      .outerRadius(105)
      .startAngle(-45 * (pi/180)) #converting from degs to radians
      .endAngle(15 * (pi/180))

    vis.append('path')
      .attr("d", arc)
      .attr("transform", "translate(200,200)")


    # vis.exit()
    #    .transition()
    #    .attr('width', 0)
    #    .attr('height', 0)
    #    .remove()





$(document).ready(app.ready)
