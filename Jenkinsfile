pipeline {
    agent any

    environment {
        TERRAFORM_VERSION = '1.4.6'  // Specify the version of Terraform you want to use
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your repository
                checkout scm
            }
        }

        stage('Install Terraform') {
            steps {
                script {
                    // Install Terraform using the specified version
                    def terraformInstalled = sh(script: "terraform version", returnStatus: true)

                    if (terraformInstalled != 0) {
                        echo "Terraform not found, installing version ${TERRAFORM_VERSION}..."

                        // Install Terraform based on the OS
                        sh """
                            curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip
                            unzip terraform.zip
                            sudo mv terraform /usr/local/bin/
                            terraform -version
                        """
                    } else {
                        echo "Terraform is already installed"
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run Terraform Plan
                    echo "Running Terraform Plan..."
                    sh 'terraform init'  // Initialize Terraform
                    sh 'terraform plan -out=tfplan'  // Run the terraform plan and save the output in a file
                }
            }
        }

        stage('Post Plan Actions') {
            steps {
                script {
                    // You can add any actions you need after running the plan (e.g., approval, plan review)
                    echo "Terraform plan executed successfully"
                }
            }
        }
    }

    post {
        always {
            // Clean up or perform actions that need to run after the pipeline, regardless of success or failure
            echo "Cleaning up..."
            sh 'rm -f terraform.zip'  // Clean up downloaded terraform.zip
        }
    }
}