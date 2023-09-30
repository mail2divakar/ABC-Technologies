pipeline {
    agent {
        label 'worker-1'
    }
    environment {     
    DOCKERHUB_CREDENTIALS= credentials('dockerhubaccount')     
    }
    stages {
        stage("Clone Git Repository") {
            steps {
                git(
                    url: "https://github.com/mail2divakar/ABC-Technologies.git",
                    branch: "main",
                    changelog: true,
                    poll: true
                )
            }
        }
        stage("Clean the project") {
            steps {
                sh "mvn clean"
            }
        }
        stage("Test the project") {
            steps {
                sh "mvn test"
            }
        }
        stage("Package the project") {
            steps {
                sh "mvn package -DskipTests"
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t pgp-project:latest .'
                    //sh 'docker tag pgp-project divakarpgpdevops/pgp-project:demo'
                }
            }
        }
        
        //stage('Login') {
          //steps {
          //  sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          //}
        //}
        
        stage('Push image to Hub'){
            options {
                timeout(time: 30, unit: "SECONDS")
            }
            steps{
                script{
					//withCredentials([usernamePassword(credentialsId: 'dockerhubaccount', passwordVariable: 'password', usernameVariable: 'username')]){
					//		 sh '''
					//			echo "${password} | docker login -u ${username} --password-stdin"
					//		 '''
					//sh 'echo completed login, now pushing to hub'
                    //sh 'docker push divakarpgpdevops/pgp-project:latest'  
					//echo 'Push Image Completed'
					//sh "docker logout"
					
    					//withCredentials([usernamePassword(credentialsId: 'dockerhubaccount', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                         //  "echo $PASS | docker login -u $USER --password-stdin"
                        //}
                        sh "docker push divakarpgpdevops/pgp-project:demo"
					
					//withDockerRegistry([credentialsId: "dockerhubaccount", url: "https://index.docker.io/v1/"]) {
					
					
					
                    
					//}
                    //}
				
				}
			}
		}
	}
	/*post{
		always {  
			sh 'echo '           
		}      
	} */   
}
