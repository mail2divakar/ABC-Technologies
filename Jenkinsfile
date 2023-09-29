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
        stage("test the project") {
            steps {
                sh "mvn test"
            }
        }
        stage("install the project") {
            steps {
                sh "mvn package"
            }
        }
    }
    
}
