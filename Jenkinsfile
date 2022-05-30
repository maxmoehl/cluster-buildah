pipeline {
    agent {
        kubernetes {
            yamlFile 'jenkins-pod.yaml'
            defaultContainer 'buildah'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'buildah bud -t registry:5000/buildah:0.1.1 .'
            }
        }
        stage('Push') {
            steps {
                sh 'buildah push '
            }
        }
    }
}
