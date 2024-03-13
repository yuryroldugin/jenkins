podTemplate {
    node(POD_LABEL) {
    stage('Build-Docker-Image') {
      steps {
        container('docker') {
          sh 'docker build -t testing-image:latest .'
        }
      }
    }
    }
}
