@Library('duarte@master') _

pipeline {

  options {
    buildDiscarder(
      logRotator(
        numToKeepStr: '10',
        artifactNumToKeepStr: '10'
      )
    )
  }

  environment {
    SOURCE_BUCKET='source.reference.ci.base2.services'
    REGION='ap-southeast-2'
    COOKBOOK='demo-windows'
  }

  agent {
    node {
      label 'docker'
    }
  }

  stages {

    stage('package cookbook') {
      agent {
        docker {
          image 'base2/bakery:4.7.73'
        }
      }
      steps {
        cookbookBundle(
          cookbook: env.COOKBOOK,
          source_bucket: env.SOURCE_BUCKET,
          region: env.REGION
        )
      }
    }

    stage('bake ami') {
      agent {
        docker {
          image 'base2/bakery:4.7.73'
        }
      }
      steps {
        packer(
          type: 'windows',
          role: 'testwin19',
          runList: ["${env.COOKBOOK}::default"],
          debug: true,
          winUpdate: true,
          cookbookS3Bucket: env.SOURCE_BUCKET,
          cookbookS3Path: "chef/${env.COOKBOOK}/${env.COOKBOOK_VERSION}/cookbooks.tar.gz",
          cookbookS3Region: env.REGION,
          amiLookup: 'Base2_Win_2019-*',
          chefVersion: '14.15.6',
          amiTags: [
            'BranchName': env.BRANCH_NAME,
            'Cookbook': env.COOKBOOK_VERSION
          ]
        )
      }
    }

  }

  post {
      always {
        deleteDir()
      }
    }

}
