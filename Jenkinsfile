pipeline {
    agent any

    stages {
        stage('STAGE 1 - clone Git repo') {
            steps {
                sh 'echo "Git repo cloned!"'
            }
        }
        stage('STAGE 2 - create Docker image') {
            steps {
                def customImage = docker.build("test_image")
				customImage.inside { 
					sh 'echo "tests  done!"' 
				}
            }
        }
    }
}

