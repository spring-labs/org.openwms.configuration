#!groovy

node {
   def mvnHome
   stage('\u27A1 Preparation') {
      git 'git@github.com:spring-labs/org.openwms.configuration.git'
      mvnHome = tool 'M3'
   }
   stage('\u27A1 Build') {
         sh "'${mvnHome}/bin/mvn' clean package -U"
   }
   stage('\u27A1 Results') {
      archive 'target/*.jar'
   }
   stage('\u27A1 Heroku Staging') {
      sh "git remote add heroku https://:${HEROKU_API_KEY}@git.heroku.com/openwms-configuration.git"
      sh "git push heroku master -f"
   }
}