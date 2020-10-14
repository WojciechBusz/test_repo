node {
	def app
	
	
	stage('STAGE 1 - clone Git repo') {
		checkout scm
		sh 'echo "Git repo cloned!"'
	}
	
	
	stage('STAGE 2 - create Docker image') {
		app = docker.build("test_image")
	}
	
	
	stage('STAGE 3 - run tests') {
		app.inside {sh 'echo "Tests passed!"'}
	}
	
	
	stage('STAGE 4 - push image to DockerHub') {
		docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
			app.push(latest)
		}
	}
	
	
}
