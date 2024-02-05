pipeline {

  agent {
    kubernetes {
      label 'sample-app'
      defaultContainer 'jnlp'
      yaml """
  apiVersion: v1
  kind: Pod
  metadata:
  labels:
    component: ci
  spec:
    # Use service account that can deploy to all namespaces
    serviceAccountName: cd-jenkins
    containers:
    - name: terraform
      image: hashicorp/terraform
      command:
      - cat
      tty: true
  """
  }
}
  stages {
    stage('Terraform init') {
      steps {
        container('terraform') {
          sh "terraform init"
        }
      }
    }

    stage('Terraform plan') {
      steps {
        container('terraform') {
          sh "terraform plan"
        }
      }
    }

    stage('Terraform apply') {
      steps {
        container('terraform') {
          sh "terraform apply --auto-approve"
        }
      }
    }
  }
}