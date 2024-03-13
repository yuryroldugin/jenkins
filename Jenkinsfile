podTemplate(containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'sleep', args: '99d'),
  ]) {

  node(POD_LABEL) {
        stage('Get a project') {
            git 'https://github.com/yuryroldugin/jenkins.git'
            container('docker') {
                stage('Build an image') {
                    sh 'docker build -t image .'
                }
            }
        }
     }
   }
