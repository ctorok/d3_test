# window.app makes a global variable called 'app'. The window does this.
# this is so we can access this from anywhere. if it's not global, you can't get to it
window.app =
  ready: ->
    setInterval(app.update_time, 1000)
    setInterval(app.show_stairs, 1000)

  update_time: ->
    time = moment().format('YYYY/MM/DD, hh:mm:ss')
    $('#time').text(time)

  show_stairs: ->
    height = 500
    sec = moment().format('s').toNumber()
    rects = d3.select('svg').selectAll('rect').data([1..sec])
    # the above line glues the data together
    # the below line 'enter' is the update. produce some new rectangles
    rects.enter()
      .append('rect')
      .attr('width', 20)
      .attr('height', 5)
      .attr('x', (d) -> (d - 1) * 20)
      .attr('y', (d) -> height - ((d - 1) * 5))
      .transition()
      .style('fill', "rgb(#{Number.random(0,255)}, #{Number.random(0,255)}, #{Number.random(0,255)})")
    rects.exit()
      .transition()
      .attr('width', 0)
      .attr('height', 0)
      .remove()





  show_clock: ->
    sec = moment().format('s').toNumber()
    rem = sec % 3
    rem10 = sec % 10
    # rem is going to be 0 or 1 or 2
    # sec is going to be 0 to 59
    # colors = ['red', 'green', 'blue']
    colors = ['red','orange','green','blue','yellow','purple','white','cyan','navy','black']
    d3.select('.three')
      .transition()
      .duration(1000)
      .attr('r', rem * 50)
      .style('fill', colors[rem])

      d3.select('.ten')
        .transition()
        .duration(1000)
        .attr('r', rem10 * 10)
        .style('fill', colors[rem10])



  color_body: ->
    d3.select('body')
      .transition()
      .duration(1000)
      .style('background-color', 'blue')
      .transition()
      .duration(1000)
      .style('background-color', 'red')



$(document).ready(app.ready)
