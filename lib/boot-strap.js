
require(['lib/playcraft', 'lib/game/main'], function(pc, Game) {
  pc.device.onReady = function() {
    if (this.isiPad) {
      this.showDebug = false;
      this.soundEnabled = false;
    }
    if (this.started) {
      return;
    }
    this.game = eval('new ' + this.gameClass + '()');
    if (!this.game) {
      throw "Invalid game class";
    }
    this.canvas = document.createElement('canvas');
    this.canvas.width = window.innerWidth;
    this.canvas.height = window.innerHeight;
    document.body.appendChild(this.canvas);
    if (!this.canvas) {
      throw 'Abort! Could not attach to a canvas element using the id [' + this.canvasId + ']. ' + 'Add a canvas element to your HTML, such as <canvas id="pcGameCanvas"></canvas>';
    }
    this.input._onReady();
    this.ctx = this.canvas.getContext('2d');
    this.panelElement = this.canvas.parentNode;
    this.onResize();
    if (this.showDebug) {
      this.debugPanel.onReady();
    }
    this.lastFrame = Date.now();
    this.game.onReady();
    this.requestAnimFrame(this.cycle.bind(this));
    return this.started = true;
  };
  window._gameClass = Game;
  return pc.device.boot('', '_gameClass');
});
