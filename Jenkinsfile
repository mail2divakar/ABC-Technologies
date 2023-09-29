pipeline {
    agent {
        label 'worker-1'
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
                sh "mvn package"
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t javatechie/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u javatechie -p ${dockerhubpwd}'
                   }
                   sh 'docker push javatechie/devops-integration'
                }
            }
        }
    }
    
}
