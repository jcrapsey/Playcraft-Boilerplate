require.config
	paths :

		#game quick reference
		"game" : "lib/game"

		#Gamecore
		"gamecore/base"       : "components/playcraftjs/lib/ext/gamecore.js/src/base"
		"gamecore/gamecore"   : "components/playcraftjs/lib/ext/gamecore.js/src/gamecore"
		"gamecore/class"      : "components/playcraftjs/lib/ext/gamecore.js/src/class"
		"gamecore/jhashtable" : "components/playcraftjs/lib/ext/gamecore.js/src/jhashtable"
		"gamecore/device"     : "components/playcraftjs/lib/ext/gamecore.js/src/device"
		"gamecore/perf"       : "components/playcraftjs/lib/ext/gamecore.js/src/perf"
		"gamecore/linkedlist" : "components/playcraftjs/lib/ext/gamecore.js/src/linkedlist"
		"gamecore/hashlist"   : "components/playcraftjs/lib/ext/gamecore.js/src/hashlist"
		"gamecore/stacktrace" : "components/playcraftjs/lib/ext/gamecore.js/src/stacktrace"
		"gamecore/pooled"     : "components/playcraftjs/lib/ext/gamecore.js/src/pooled"

		#Playcraft
		"playcraft/playcraft" : "components/playcraftjs/lib/playcraft"

		"playcraft/boot"         : "components/playcraftjs/lib/boot"
		"playcraft/input"        : "components/playcraftjs/lib/input"
		"playcraft/hashmap"      : "components/playcraftjs/lib/hashmap"
		"playcraft/tools"        : "components/playcraftjs/lib/tools"
		"playcraft/color"        : "components/playcraftjs/lib/color"
		"playcraft/debug"        : "components/playcraftjs/lib/debug"
		"playcraft/device"       : "components/playcraftjs/lib/device"
		"playcraft/sound"        : "components/playcraftjs/lib/sound"
		"playcraft/layer"        : "components/playcraftjs/lib/layer"
		"playcraft/entitylayer"  : "components/playcraftjs/lib/entitylayer"
		"playcraft/tileset"      : "components/playcraftjs/lib/tileset"
		"playcraft/tilemap"      : "components/playcraftjs/lib/tilemap"
		"playcraft/tilelayer"    : "components/playcraftjs/lib/tilelayer"
		"playcraft/entity"       : "components/playcraftjs/lib/entity"
		"playcraft/sprite"       : "components/playcraftjs/lib/sprite"
		"playcraft/spritesheet"  : "components/playcraftjs/lib/spritesheet"
		"playcraft/math"         : "components/playcraftjs/lib/math"
		"playcraft/image"        : "components/playcraftjs/lib/image"
		"playcraft/scene"        : "components/playcraftjs/lib/scene"
		"playcraft/game"         : "components/playcraftjs/lib/game"
		"playcraft/loader"       : "components/playcraftjs/lib/loader"
		"playcraft/dataresource" : "components/playcraftjs/lib/dataresource"

		"playcraft/components/component"       : "components/playcraftjs/lib/components/component"
		"playcraft/components/physics"         : "components/playcraftjs/lib/components/physics"
		"playcraft/components/alpha"           : "components/playcraftjs/lib/components/alpha"
		"playcraft/components/joint"           : "components/playcraftjs/lib/components/joint"
		"playcraft/components/expiry"          : "components/playcraftjs/lib/components/expiry"
		"playcraft/components/originshifter"   : "components/playcraftjs/lib/components/originshifter"
		"playcraft/components/spatial"         : "components/playcraftjs/lib/components/spatial"
		"playcraft/components/overlay"         : "components/playcraftjs/lib/components/overlay"
		"playcraft/components/clip"            : "components/playcraftjs/lib/components/clip"
		"playcraft/components/activator"       : "components/playcraftjs/lib/components/activator"
		"playcraft/components/input"           : "components/playcraftjs/lib/components/input"
		"playcraft/components/fade"            : "components/playcraftjs/lib/components/fade"
		"playcraft/components/rect"            : "components/playcraftjs/lib/components/rect"
		"playcraft/components/text"            : "components/playcraftjs/lib/components/text"
		"playcraft/components/sprite"          : "components/playcraftjs/lib/components/sprite"
		"playcraft/components/layout"          : "components/playcraftjs/lib/components/layout"
		"playcraft/components/particleemitter" : "components/playcraftjs/lib/components/particleemitter"

		"playcraft/es/entitymanager" : "components/playcraftjs/lib/es/entitymanager"
		"playcraft/es/systemmanager" : "components/playcraftjs/lib/es/systemmanager"

		"playcraft/systems/system"       : "components/playcraftjs/lib/systems/system"
		"playcraft/systems/entitysystem" : "components/playcraftjs/lib/systems/entitysystem"
		"playcraft/systems/physics"      : "components/playcraftjs/lib/systems/physics"
		"playcraft/systems/effects"      : "components/playcraftjs/lib/systems/effects"
		"playcraft/systems/particles"    : "components/playcraftjs/lib/systems/particles"
		"playcraft/systems/input"        : "components/playcraftjs/lib/systems/input"
		"playcraft/systems/expiry"       : "components/playcraftjs/lib/systems/expiry"
		"playcraft/systems/activation"   : "components/playcraftjs/lib/systems/activation"
		"playcraft/systems/render"       : "components/playcraftjs/lib/systems/render"
		"playcraft/systems/layout"       : "components/playcraftjs/lib/systems/layout"

		#Other
		"base64"    : "components/playcraftjs/lib/ext/base64"
		"box2dweb"  : "components/playcraftjs/lib/ext/box2dweb.2.1a-pc"
		
	shim :
		"gamecore/base"       : [ "gamecore/class" ]
		"gamecore/class"      : [ "gamecore/gamecore" ]
		"gamecore/jhashtable" : [ "gamecore/base" ]
		"gamecore/device"     : [ "gamecore/base" ]
		"gamecore/perf"       : [ "gamecore/base" ]
		"gamecore/linkedlist" : [ "gamecore/base" ]
		"gamecore/hashlist"   : [ "gamecore/base" ]
		"gamecore/stacktrace" : [ "gamecore/base" ]
		"gamecore/pooled"     : [ "gamecore/base" ]

		"playcraft/boot" : [ 
			"playcraft/playcraft" 
			"gamecore/jhashtable"
			"gamecore/device"
			"gamecore/perf"
			"gamecore/linkedlist"
			"gamecore/hashlist"
			"gamecore/stacktrace"
			"gamecore/pooled"
		]

		"playcraft/input"        : { deps:[ "playcraft/boot" ], exports : "pc.Input" }
		"playcraft/hashmap"      : { deps:[ "playcraft/boot" ], exports : "pc.Hashmap" }
		"playcraft/tools"        : { deps:[ "playcraft/boot" ], exports : "pc.Tools" }
		"playcraft/color"        : { deps:[ "playcraft/boot" ], exports : "pc.Color" }
		"playcraft/debug"        : { deps:[ "playcraft/boot" ], exports : "pc.DebugPanel" }
		"playcraft/device"       : { deps:[ "playcraft/boot" ], exports : "pc.Device" }
		"playcraft/sound"        : { deps:[ "playcraft/boot" ], exports : "pc.Sound" }
		"playcraft/layer"        : { deps:[ "playcraft/boot" ], exports : "pc.Layer" }
		"playcraft/entitylayer"  : { deps:[ "playcraft/boot", "playcraft/layer" ], exports : "pc.EntityLayer" }
		"playcraft/tileset"      : { deps:[ "playcraft/boot" ], exports : "pc.TileSet" }
		"playcraft/tilemap"      : { deps:[ "playcraft/boot" ], exports : "pc.TileMap" }
		"playcraft/tilelayer"    : { deps:[ "playcraft/boot", "playcraft/layer" ], exports : "pc.TileLayer" }
		"playcraft/entity"       : { deps:[ "playcraft/boot" ], exports : "pc.Entity" }
		"playcraft/sprite"       : { deps:[ "playcraft/boot" ], exports : "pc.Sprite" }
		"playcraft/spritesheet"  : { deps:[ "playcraft/boot" ], exports : "pc.SpriteSheet" }
		"playcraft/math"         : { deps:[ "playcraft/boot" ], exports : "pc.Math" }
		"playcraft/image"        : { deps:[ "playcraft/boot" ], exports : "pc.Image" }
		"playcraft/scene"        : { deps:[ "playcraft/boot" ], exports : "pc.Scene" }
		"playcraft/game"         : { deps:[ "playcraft/boot" ], exports : "pc.Game" }
		"playcraft/loader"       : { deps:[ "playcraft/boot" ], exports : "pc.Loader" }
		"playcraft/dataresource" : { deps:[ "playcraft/boot" ], exports : "pc.DataResource" }

		"playcraft/components/component"       : { deps:[ "playcraft/boot" ], exports : "pc.components.Component" }
		"playcraft/components/physics"         : { deps:[ "playcraft/boot", "playcraft/components/component", "box2dweb" ], exports : "pc.components.Physics" }
		"playcraft/components/alpha"           : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Alpha" }
		"playcraft/components/joint"           : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Joint" }
		"playcraft/components/expiry"          : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Expiry" }
		"playcraft/components/originshifter"   : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.OriginShifter" }
		"playcraft/components/spatial"         : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Spatial" }
		"playcraft/components/overlay"         : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Overlay" }
		"playcraft/components/clip"            : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Clip" }
		"playcraft/components/activator"       : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Activator" }
		"playcraft/components/input"           : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Input" }
		"playcraft/components/fade"            : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Fade" }
		"playcraft/components/rect"            : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Rect" }
		"playcraft/components/text"            : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Text" }
		"playcraft/components/sprite"          : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Sprite" }
		"playcraft/components/layout"          : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.Layout" }
		"playcraft/components/particleemitter" : { deps:[ "playcraft/boot", "playcraft/components/component" ], exports : "pc.components.ParticleEmitter" }

		"playcraft/es/entitymanager"           : { deps:[ "playcraft/boot" ], exports : "pc.EntityManager" }
		"playcraft/es/systemmanager"           : { deps:[ "playcraft/boot" ], exports : "pc.SystemManager" }

		"playcraft/systems/system"             : { deps:[ "playcraft/boot" ], exports : "pc.systems.System" } 
		"playcraft/systems/entitysystem"       : { deps:[ "playcraft/boot", "playcraft/systems/system" ], exports : "pc.systems.EntitySystem" }
		"playcraft/systems/physics"            : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Physics" }
		"playcraft/systems/effects"            : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Effects" }
		"playcraft/systems/particles"          : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Particles" }
		"playcraft/systems/input"              : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Input" }
		"playcraft/systems/expiry"             : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Expiration" }
		"playcraft/systems/activation"         : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Activation" }
		"playcraft/systems/render"             : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Render" }
		"playcraft/systems/layout"             : { deps:[ "playcraft/boot", "playcraft/systems/entitysystem" ], exports : "pc.systems.Layout" }
