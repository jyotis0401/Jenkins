pipeline{
    agent any
    stages{
        stage('Clone Git'){
            steps{
                git 'https://github.com/jyotis0401/Jenkins.git'
            }
        }
        stage('Build Code'){
            steps{
                sh "chmod u+x main.cpp"
                sh "gcc main.cpp - o main"
                sh "./main"
            }
        }
        // stage('Test code')
    }
}