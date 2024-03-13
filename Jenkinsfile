podTemplate {
    node(POD_LABEL) {
    stage('Get a project') {
      git 'https://github.com/yuryroldugin/jenkins.git'
      container('docker') {
        stage( 'Build-Docker-Image') {
          sh 'docker build -t testing-image:latest .'
        }
      }
    }
  }
}
