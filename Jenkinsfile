node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("quay.io/rin_whoami/docker-kubernetes")
    }

}

agent {
        docker { image 'quay.io/rin_whoami/docker-kubernetes' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
