node {
	def image
	
	
	stage('STAGE 1 - clone Git repo') {
		checkout scm
		sh 'echo "Git repo cloned!"'
	}
	
	
	stage('STAGE 2 - create Docker image') {
		image = docker.build("wojciechbusz/test_image")
	}
	
	
	stage('STAGE 3 - run tests') {
		image.inside {sh "echo 'Running this command inside of a created container.'"}
	}
	
	
	stage('STAGE 4 - push image to DockerHub') {
		docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
			image.push("latest")
			image.push("${env.BUILD_NUMBER}")
		}
	}
	
	
	stage('STAGE 5 - image cleanup') {
		sh 'docker rmi registry.hub.docker.com/wojciechbusz/test_image:"$BUILD_NUMBER"'
		sh 'docker rmi registry.hub.docker.com/wojciechbusz/test_image'
		sh 'docker rmi wojciechbusz/test_image'
	}
	
	
}
