
define(['lib/playcraft', 'game/scenes/playarea'], function(pc, PlayareaScene) {
  return pc.Game.extend({}, {
    onReady: function() {
      this._super();
      pc.device.loader.add(new pc.Image('minu', 'media/small_minu.png'));
      return pc.device.loader.start(this.onLoading.bind(this), this.onLoaded.bind(this));
    },
    onLoading: function(percentage) {
      return console.log('loading (' + percentage + ')');
    },
    onLoaded: function() {
      return this.addScene(new PlayareaScene);
    },
    onLoad: function(e) {
      return console.log('loaded image');
    },
    onError: function(err) {
      return console.log(err);
    }
  });
});
