require [  
	'lib/playcraft'
	'lib/game/main'
],(pc,Game)->

	pc.device.onReady = ->

		if @isiPad
			@showDebug = false
			@soundEnabled = false

		return if @started

		@game = eval('new '+@gameClass+'()')

		if not @game
			throw "Invalid game class"

		@canvas = document.createElement 'canvas'
		@canvas.width = window.innerWidth
		@canvas.height = window.innerHeight
		document.body.appendChild @canvas

		if not @canvas
			throw 'Abort! Could not attach to a canvas element using the id [' + this.canvasId + ']. ' + 'Add a canvas element to your HTML, such as <canvas id="pcGameCanvas"></canvas>';

		@input._onReady()
		@ctx = @canvas.getContext('2d')

		@panelElement = @canvas.parentNode
		@onResize()

		if @showDebug
			@debugPanel.onReady()
   
		@lastFrame = Date.now()

		@game.onReady()

		@requestAnimFrame @cycle.bind(@)

		@started = true


	
	#debugCanvas = document.createElement 'canvas'
	window._gameClass = Game
	pc.device.boot '','_gameClass'
	
	
