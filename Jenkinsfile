podTemplate(containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'sleep', args: '99d'),
  ]) {

  node(POD_LABEL) {
    stage('Clone') {
      steps {
        container('docker') {
          git branch: 'main', changelog: false, poll: false, url: 'https://githib.com/yuryroldugin/jenkins.git'
        }
      }
    }
  }
}
