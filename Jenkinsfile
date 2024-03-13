podTemplate(containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
      stage('Clone') {
        container('docker') {
          git branch: 'main', changelog: false, poll: false, url: 'https://github.com/yuryroldugin/jenkins.git'
        }
      }  
      stage('Build') {
        container('docker') {
            sh 'ls -a'
            sh 'docker build -t image .'
        }
      }
   }
}
