podTemplate(yaml: '''
    apiVersion: v1
    kind: Pod
    spec:
      containers:
      - name: docker
        image: docker:latest
        command:
        - sleep
        args:
        - 99d
        volumeMounts:
        - mountPath: /var/run/docker.sock
          name: docker-sock
        volumes:
        - name: docker-sock
          hostPath:
          path: /var/run/docker.sock
''') {
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
