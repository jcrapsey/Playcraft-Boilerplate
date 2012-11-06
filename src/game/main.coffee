define [
	'lib/playcraft'
	'game/scenes/playarea'
],(pc,PlayareaScene)->

	pc.Game.extend {

	},{
		onReady:->
			@_super()

			#if pc.device.devMode
				#pc.device.loader.setDisableCache()

			pc.device.loader.add new pc.Image 'minu', 'media/small_minu.png'

			pc.device.loader.start @onLoading.bind(@), @onLoaded.bind(@)


		onLoading : (percentage)->
			#loading code
			console.log 'loading ('+percentage+')'

		onLoaded : ->
			#we are ready
            @addScene new PlayareaScene

        onLoad : (e)->
        	console.log 'loaded image'

        onError : (err)->
        	console.log err
	}