pipeline {
    agent {
        kubernetes {
            yamlFile 'jenkins.yml'
            defaultContainer 'buildah'
        }
    }
    stages {
        tag = ""
        stage('Configure') {
            steps {
                tag = sh 'git tag --points-at HEAD'
            }
        }
        stage('Build') {
            steps {
                sh 'buildah bud -t registry:5000/buildah:${tag} .'
            }
        }
        stage('Push') {
            steps {
                sh 'buildah push --tls-verify=false registry:5000/buildah:${tag}'
            }
        }
    }
}
