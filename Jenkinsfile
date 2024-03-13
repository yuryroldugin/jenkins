node {
    withEnv(['registry=quay.io/rin_whoami/docker-kubernetes']) {

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
        /* We'd better run a set of tests against the image */
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
  withEnv(['repo=https://github.com/yuryroldugin/jenkins.git']) {
  
  node(POD_LABEL){
    stage('Deploy Application') {
      git url: repo, branch: 'main'
      withKubeConfig([credentialsId: 'jenkins']) {
        sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.28.7/bin/linux/amd64/kubectl"'
        sh 'chmod u+x ./kubectl'
        sh './kubectl get all'
        sh './kubectl apply -f ./deployment.yaml'
        }
      }
    }
  }
}
