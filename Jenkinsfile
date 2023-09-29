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
                sh "mvn package -DskipTests"
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t divakarpgpdevops/pgp-project .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u divakarpgpdevops -p ${dockerhubpwd}'
                    }
                   sh 'docker push divakarpgpdevops/pgp-project'
                }
            }
        }
    }
    
}
