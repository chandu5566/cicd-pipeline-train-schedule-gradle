ns {
  //inlude the nodeJS plugin to execute nodejs and npm tasks
  id "com.moowork.node" version "1.2.0"
}

node {
	download = true
	version = "9.11.1"
	npmVersion = "5.6.0"
}

//declare a build task
task build

//declare a task to create a zip of the app
task zip(type: Zip) {
	from ('.') {
		include "*"
		include "bin/**"
		include "data/**"
		include "node_modules/**"
		include "public/**"
		include "routes/**"
		include "views/**"
	}
	destinationDir(file("dist"))
	baseName "trainSchedule"
}

//declare task dependencies
build.dependsOn zip
zip.dependsOn npm_build
npm_build.dependsOn npm_test
npm_test.dependsOn npmInstall
npm_build.dependsOn npmInstall
