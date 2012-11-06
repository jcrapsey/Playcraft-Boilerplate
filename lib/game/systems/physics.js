
define(['lib/playcraft'], function(pc) {
  return pc.systems.Physics.extend({}, {
    onCollision: function(aType, bType, entityA, entityB, force, fixtureAType, fixtureBType, contact) {
      return console.log('collision');
    }
  });
});

/*
GamePhysics = pc.systems.Physics.extend('GamePhysics',
    {},
    {
        smokeSheet:null,
        explosionSound:null,
        encouragements: null,

        init:function (options)
        {
            this._super(options);
            this.smokeSheet = new pc.SpriteSheet(
                {image:pc.device.loader.get('smoke').resource,
                    frameWidth:32, frameHeight:32, framesWide:16, framesHigh:1});
            this.smokeSheet.addAnimation({ name:'smoking', time:1000, loops:1 });

            if (pc.device.soundEnabled)
            {
                this.explosionSound = pc.device.loader.get('explosion').resource;
                this.explosionSound.setVolume(0.8);
            }

            this.encouragements =
                ['Nice job!', 'Wow', "I wouldn't want to be an asteroid right now", 'Kapingo!',
                'Boom! Roidshot!', "SMASH!", 'Another one bites the moondust', 'YUM!', 'Do you ever miss?'];
        },

        onCollision:function (aType, bType, entityA, entityB, force, fixtureAType, fixtureBType, contact)
        {
        },

        onCollisionStart:function (aType, bType, entityA, entityB, fixtureAType, fixtureBType, contact)
        {
            if ((entityB.hasTag('ASTEROID') || entityB.hasTag('ASTEROID-SMALL')) && entityA.hasTag('BULLET'))
            {
                // halt the bullet, turning off collision detection as well, then remove it
                entityA.getComponent('physics').setCollisionMask(0);
                entityA.getComponent('physics').setLinearVelocity(0, 0);
                entityA.remove();

                this.explosionSound.play(false);

                // change the asteroid (entityB in this case)
                if (!entityB.hasComponentOfType('expiry'))
                {
                    entityA.layer.scene.asteroidsLeft--;
                    entityB.getComponent('physics').setCollisionMask(0);
                    entityB.getComponent('physics').setLinearVelocity(0, 0);

                    // switch the asteroid sprite into a smoke explosion
                    entityB.getComponent('sprite').sprite.setSpriteSheet(this.smokeSheet);
                    entityB.addComponent(pc.components.Expiry.create({ lifetime:2500 }));

                    // if a big asteroid is blowing up, then spawn some little asteroids
                    if (entityB.hasTag('ASTEROID'))
                    {
                        var sp = entityB.getComponent('spatial');
                        var count = 3;//pc.Math.rand(2, 5);
                        for (var i = 0; i < count; i++)
                        {
                            var addX = 0;
                            var addY = 0;
                            if (sp.pos.x < sp.dim.x) addX += sp.dim.x + 1;
                            if (sp.pos.y < sp.dim.y) addY += sp.dim.y + 1;
                            if (sp.pos.x > pc.device.canvasWidth - sp.dim.x) addX = -sp.dim.x + 1;
                            if (sp.pos.y > pc.device.canvasHeight - sp.dim.y) addY = -sp.dim.y + 1;
                            this.layer.scene.createEntity('asteroid-small', this.layer, sp.pos.x + addX, sp.pos.y + addY);
                        }

                        entityA.layer.scene.asteroidsLeft += count;
                    }
                }

                entityA.layer.scene.leftCounter.getComponent('text').text[0] = 'Asteroids Left: ' + entityA.layer.scene.asteroidsLeft;
                entityA.layer.scene.displayText(this.encouragements[pc.Math.rand(0, this.encouragements.length-1)]);
            }
        },

        onCollisionEnd:function (aType, bType, entityA, entityB, fixtureAType, fixtureBType, contact)
        {
        }

    });


CollisionType =
{
    NONE:0x0000, // BIT MAP
    BULLETS:0x0001, // 0000001
    ENEMY:0x0002, // 0000010
    FRIENDLY:0x0004 // 0000100
};
*/

