module.exports = function(grunt) {

	grunt.loadNpmTasks('grunt-contrib-copy')
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-compress');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-contrib-jade');
	grunt.loadNpmTasks('grunt-requirejs');

	// Project configuration.
	grunt.initConfig({

		// Coffee Script Configurations
		coffee: {
			options: {
		        bare: true,
		        flatten : false
		    },
			compile : {
				files : {
					"lib/*.js" : "src/**/*.coffee"
				}
			}
		},

		// Jade File Configurations
		jade : {
			compile: {
				options: {
					flatten : false
				},
				files: {
					"lib/index.html" : "src/index.jade",
					"lib/browser/index.html": "src/browser/index.jade"
				}
			}
		},

		// Watch command
		watch: {
			files: 'src/**/*',
			tasks: ['trans']
		},

		//Require JS config
		requirejs: {
			baseUrl: "./",
			name: "lib/boot-strap",
			preserveLicenseComments: false,
			useSourceUrl: false,
			paths : {
				'requireLib' : 'components/requirejs/index'
			},
			deps : ['requireLib'],
			wrap: {
				start: "(function() {",
				end: "}());"
			},
		    optimize: "uglify",
			out: "./build/game.js"
		},

		//Clean config
		clean: {
			build: ['./build'],
			cocoon: ['./dist/cocoon/*'],
			browser: ['./dist/browser/*']
		},

		//Compress config
		compress : {
			zip : {
				files : {
					'./build/game.zip': './build/**/*'
				}
			}
		},

		//Copy Config
		copy: {

			media: {
				files: {
					"./build/media/": "./media/**/*"
				}
			},

			cocoon: {
				files: {
					"./dist/cocoon/": "./build/game.zip"
				}
			},

			browser: {
				files: {
					"./dist/browser/": "./build/**/*",
					"./dist/browser/index.html": "./lib/browser/index.html"
				}
			}
		}

	});

	// Setup
	grunt.registerTask('setup',['',''])
	
	// Build Tasks
	grunt.registerTask('build',['build:cocoon','build:browser']);

	grunt.registerTask('build:cocoon','',function(){
		grunt.config.set('requirejs.mainConfigFile','lib/cocoonjs/config.js');
		grunt.task.run('clean:cocoon requirejs copy:media compress:zip copy:cocoon clean:build');
	});

	grunt.registerTask('build:browser','',function(){
		grunt.config.set('requirejs.mainConfigFile','lib/browser/config.js');
		grunt.task.run('clean:browser requirejs copy:media copy:browser clean:build');
	});

	// Transpile task.
	grunt.registerTask('trans', 'Transpile Coffee and Jade', function(){
		grunt.log.write('\nTranspiling ...\n')
		grunt.task.run('coffee jade');
	});

	// Default task.
	grunt.registerTask('default', '');

	var watermark = ['',' ____  _                             __ _   ','|  _ \\| | __ _ _   _  ___ _ __ __ _ / _| |_ ','| |_) | |/ _` | | | |/ __| \'__/ _` | |_| __|','|  __/| | (_| | |_| | (__| | | (_| |  _| |_ ','|_|   |_|\\__,_|\\__, |\\___|_|  \\__,_|_|  \\__|','---------------|___/------------------------',''].join('\n');
	//var watermark = ['','','----------------------------------------------------------',' ____  _     _             ____                           ','|  _ \\(_)___| | ___   _   / ___| __ _ _ __ ___   ___  ___ ','| |_) | / __| |/ / | | | | |  _ / _` | \'_ ` _ \\ / _ \\/ __|','|  _ <| \\__ \\   <| |_| | | |_| | (_| | | | | | |  __/\\__ \\','|_| \\_\\_|___/_|\\_\\\\__, |  \\____|\\__,_|_| |_| |_|\\___||___/','------------------|___/-----------------------------------',''].join('\n')
	console.log(watermark);
};
