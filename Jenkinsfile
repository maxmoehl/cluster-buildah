def version_tag

pipeline {
    agent {
        kubernetes {
            yamlFile 'jenkins.yml'
            defaultContainer 'buildah'
        }
    }
    stages {
        stage('Collect Tag') {
            steps {
                script {
                    version_tag = sh(
                        script: 'git tag --points-at HEAD',
                        returnStdout: true
                    ).trim()
                }
            }
        }
        stage('Build') {
            steps {
                sh 'buildah bud -t registry:5000/buildah:${version_tag} .'
            }
        }
        stage('Push') {
            steps {
                sh 'buildah push --tls-verify=false registry:5000/buildah:${version_tag}'
            }
        }
    }
}
