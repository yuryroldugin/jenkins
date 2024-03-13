podTemplate(containers: [
    containerTemplate(name: 'php', image: 'php', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
      stage('Clone') {
          container('php') {
            git branch: 'main', changelog: false, poll: false, url: 'https://github.com/yuryroldugin/jenkins.git'
          }
      }    
      stage('Show a project') {
        container('php') {
          sh 'ls -a'
          sh 'cp index.html /var/www/html'
        }
      }
   }
}
