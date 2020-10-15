node {
	
	
	stage('STAGE 1 - clone Git repo') {
		checkout scm
		sh 'echo "Git repo cloned!"'
	}
	
	
	stage('STAGE 2 - create Docker image') {
		docker.build("wojciechbusz/test_image")
	}
	
	
	stage('STAGE 3 - run tests') {
		docker.image("wojciechbusz/test_image").withRun {c ->
			sh '/opt/repo/script_1.py'
		}
	}
	
	
	stage('STAGE 4 - push image to DockerHub') {
		docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
			docker.image("wojciechbusz/test_image").push("latest")
		}
	}
	
	
	stage('STAGE 5 - image cleanup') {
		sh 'docker rmi registry.hub.docker.com/wojciechbusz/test_image'
		sh 'docker rmi wojciechbusz/test_image'
	}
	
}
