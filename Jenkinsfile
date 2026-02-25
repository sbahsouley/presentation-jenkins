node('docker') {
    // Définition du nom complet de l'image
    def registryProjet = 'ghcr.io/sbahsouley/presentation-jenkins'
    def IMAGE = "${registryProjet}:version-${env.BUILD_ID}"
    def img
    stage('Clone') {
        git url: 'https://github.com/sbahsouley/presentation-jenkins.git',
            branch: 'main'
    }
    stage('Build') {
        img = docker.build(IMAGE, '.')
    }
    stage('Run') {
        img.withRun("--name run-${BUILD_ID} -p 80:80") { c ->
            sh 'docker ps'
            sh 'curl -I localhost'
        }
    }
    stage('Push') {
        docker.withRegistry('https://ghcr.io', 'reg1') {
            img.push('latest')
            img.push()
        }
    }
}
