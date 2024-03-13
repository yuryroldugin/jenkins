node {
    withEnv(['registry=quay.io/rin_whoami/docker-kubernetes']) {
      stage('Blah') {
        sh 'echo Hello, ${registry}'
        }
    

    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build( registry )
    }
  
    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        docker.image( registry )withRun( '-p 8082:80' ) {c ->
        sh "curl localhost:8082"
        }
    }
    stage('Push image') {
        /* Finally, we'll push the image */
        docker.withRegistry('https://quay.io', 'quay') {
            app.push()
        }
    }
  }
}

/* And now we'll deploy test app from the image */ 
podTemplate(inheritFrom: 'default')
{
  node(POD_LABEL){
    stage('Deploy Application') {
      git url: 'https://github.com/yuryroldugin/jenkins.git', branch: 'main'
      withKubeConfig([credentialsId: 'jenkins']) {
        sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'
        sh 'chmod u+x ./kubectl'
        sh './kubectl get all'
        sh './kubectl apply -f ./deployment.yaml'
      }
    }
  }
}
