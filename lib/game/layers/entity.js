
define(['lib/playcraft'], function(pc) {
  console.log('Script -> Layer : Entity -- Loaded');
  return pc.Layer.extend({}, {
    spaceShip: null,
    init: function() {
      return this._super.apply(this, arguments);
      /*
               @minu = pc.device.loader.get('minu').resource;
      
               @window_width = window.innerWidth - 100;
               @window_height = window.innerHeight - 100;
      
               @angle = Math.random()*360;
               @x_pos = Math.random()*@window_width;
               @y_pos = Math.random()*@window_height;
      
               @x_rate = (Math.random()*10)-5
               @y_rate = (Math.random()*10)-5
      */

    },
    draw: function() {
      /*
               @angle = (@angle + 1) % 360
               @x_rate = (if ((@x_pos >= 0) and (@x_pos <= @window_width)) then (@x_rate) else (@x_rate*(-1)))
               @x_pos = @x_pos + @x_rate
      
               @y_rate = (if ((@y_pos >= 0) and (@y_pos <= @window_height)) then (@y_rate) else (@y_rate*(-1)))
               @y_pos = @y_pos + @y_rate
      
               pc.device.ctx.fillStyle = '#ff0000';
      
               
      
               @minu.draw pc.device.ctx, 0, 0, @x_pos, @y_pos, 78, 100, @angle
      
               #pc.device.ctx.fillRect(Math.random()*width, Math.random()*height, 100, 100);
      */

    }
  });
});
