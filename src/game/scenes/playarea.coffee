define [
	'lib/playcraft'
	'game/layers/entity'
	'game/systems/physics'
],(pc,EntityLayer,Physics)->

	CollisionType =
	{
		NONE:0x0000,
		BULLETS:0x0001,
		ENEMY:0x0002,
		FRIENDLY:0x0004
	};

	console.log 'Script -> Scene : PlayArea -- Loaded'

	pc.Scene.extend {

	},{
		gameLayer : null

		init : ()->
			@_super()

			@entityLayer = this.addLayer new pc.EntityLayer('entity Layer')
			@entityLayer.addSystem(new pc.systems.Render())
			@entityLayer.addSystem(new pc.systems.Layout())
			@entityLayer.addSystem(new pc.systems.Physics({gravity:{x:0,y:10}}))

			catImage = pc.device.loader.get('minu').resource
			catSpriteSheet = new pc.SpriteSheet
				image:catImage
				frameWidth:78
				frameHeight:100


			@createWall(@entityLayer, 0, 0, 1, pc.device.canvasHeight)
			@createWall(@entityLayer, 0, 0, pc.device.canvasWidth, 1)
			@createWall(@entityLayer, pc.device.canvasWidth, 0, 1, pc.device.canvasHeight)
			@createWall(@entityLayer, 0, pc.device.canvasHeight, pc.device.canvasWidth, 1)

			
			for i in [0...10] by 1
				cat = pc.Entity.create(@entityLayer)
				cat.addComponent(pc.components.Sprite.create({spriteSheet:catSpriteSheet}))
				cat.addComponent(pc.components.Spatial.create({x:pc.Math.rand(0,@entityLayer.scene.viewPort.w - 78), y:pc.Math.rand(0,@entityLayer.scene.viewPort.h - 100),w:78,h:100}))
				cat.addComponent(pc.components.Physics.create({
					force:0,
					mass:50,
					bounce:10,
					shapes:[{shape:pc.CollisionShape.CIRCLE}],
					collisionCategory:CollisionType.FRIENDLY,
					collisionMask:CollisionType.ENEMY | CollisionType.FRIENDLY
				}))
				cat.addTag('CAT')


		createWall:(layer,x,y,w,h)->
			e = pc.Entity.create(layer)
			e.addTag('WALL');
			e.addComponent(pc.components.Spatial.create({x:x, y:y, dir:0, w:w, h:h }));
			e.addComponent(pc.components.Physics.create({ 
				immovable:true,
				shapes:[{ shape:pc.CollisionShape.RECT }],
				collisionCategory:CollisionType.ENEMY,
				collisionMask:CollisionType.FRIENDLY or CollisionType.ENEMY
			}));

			return e

		process : ->
			pc.device.ctx.clearRect 0, 0, pc.device.canvasWidth, pc.device.canvasHeight
			@_super()


	}