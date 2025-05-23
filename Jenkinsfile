pipeline{
    environment {
            // GITHUB_REPO_URL = 'https://github.com/jyotis0401/scientific_calculator_devops.git'
            DOCKER_IMAGE_NAME = 'jyotis0401/demo1'
            DOCKER_CREDENTIALS = 'Docker_Credential' //we added this docker_container id in jenkins in credentials and it is taking from there using the id.
     }
    agent any
    stages{
        stage('Clone Git'){
            steps{
                git branch: 'main', url: 'https://github.com/jyotis0401/Jenkins.git'
            }
        }
        stage('Build Code'){
            steps{
                sh "chmod u+x main.cpp"
                sh "g++ main.cpp -o main"
                sh "./main"
            }
        }
        stage('Check PATH') {
            steps {
                sh 'echo $PATH'
            }
        }
        // stage('Test code')
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker --version'
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
    
                }
            }
        }
        
        stage('Docker Hub Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo "Logging into Docker Hub..."
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin || echo "Docker login failed!"
                    '''
                }
            }
        }
        stage('Push Docker Images') {
            steps {
                script {
                    sh "docker push ${DOCKER_IMAGE_NAME}"
                }
            }
        }
    }
}
