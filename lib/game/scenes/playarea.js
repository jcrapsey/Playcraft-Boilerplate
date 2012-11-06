
define(['lib/playcraft', 'game/layers/entity', 'game/systems/physics'], function(pc, EntityLayer, Physics) {
  var CollisionType;
  CollisionType = {
    NONE: 0x0000,
    BULLETS: 0x0001,
    ENEMY: 0x0002,
    FRIENDLY: 0x0004
  };
  console.log('Script -> Scene : PlayArea -- Loaded');
  return pc.Scene.extend({}, {
    gameLayer: null,
    init: function() {
      var cat, catImage, catSpriteSheet, i, _i, _results;
      this._super();
      this.entityLayer = this.addLayer(new pc.EntityLayer('entity Layer'));
      this.entityLayer.addSystem(new pc.systems.Render());
      this.entityLayer.addSystem(new pc.systems.Layout());
      this.entityLayer.addSystem(new pc.systems.Physics({
        gravity: {
          x: 0,
          y: 10
        }
      }));
      catImage = pc.device.loader.get('minu').resource;
      catSpriteSheet = new pc.SpriteSheet({
        image: catImage,
        frameWidth: 78,
        frameHeight: 100
      });
      this.createWall(this.entityLayer, 0, 0, 1, pc.device.canvasHeight);
      this.createWall(this.entityLayer, 0, 0, pc.device.canvasWidth, 1);
      this.createWall(this.entityLayer, pc.device.canvasWidth, 0, 1, pc.device.canvasHeight);
      this.createWall(this.entityLayer, 0, pc.device.canvasHeight, pc.device.canvasWidth, 1);
      _results = [];
      for (i = _i = 0; _i < 10; i = _i += 1) {
        cat = pc.Entity.create(this.entityLayer);
        cat.addComponent(pc.components.Sprite.create({
          spriteSheet: catSpriteSheet
        }));
        cat.addComponent(pc.components.Spatial.create({
          x: pc.Math.rand(0, this.entityLayer.scene.viewPort.w - 78),
          y: pc.Math.rand(0, this.entityLayer.scene.viewPort.h - 100),
          w: 78,
          h: 100
        }));
        cat.addComponent(pc.components.Physics.create({
          force: 0,
          mass: 50,
          bounce: 10,
          shapes: [
            {
              shape: pc.CollisionShape.CIRCLE
            }
          ],
          collisionCategory: CollisionType.FRIENDLY,
          collisionMask: CollisionType.ENEMY | CollisionType.FRIENDLY
        }));
        _results.push(cat.addTag('CAT'));
      }
      return _results;
    },
    createWall: function(layer, x, y, w, h) {
      var e;
      e = pc.Entity.create(layer);
      e.addTag('WALL');
      e.addComponent(pc.components.Spatial.create({
        x: x,
        y: y,
        dir: 0,
        w: w,
        h: h
      }));
      e.addComponent(pc.components.Physics.create({
        immovable: true,
        shapes: [
          {
            shape: pc.CollisionShape.RECT
          }
        ],
        collisionCategory: CollisionType.ENEMY,
        collisionMask: CollisionType.FRIENDLY || CollisionType.ENEMY
      }));
      return e;
    },
    process: function() {
      pc.device.ctx.clearRect(0, 0, pc.device.canvasWidth, pc.device.canvasHeight);
      return this._super();
    }
  });
});
