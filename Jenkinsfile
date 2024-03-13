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
//        app = docker.build("quay.io/rin_whoami/docker-kubernetes")
    }
  
    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        docker.image( registry )withRun( '-p 8082:80' ) {c ->
        sh "curl localhost:8082"
        }
    }
    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://quay.io', 'quay') {
//            app.push(registry)
            app.push()
        }
    }
    stage('Deploying js container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml",
                                         "service.yaml")
        }
      }
    }
  }
}

