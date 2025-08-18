terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "flask_app" {
  name = "my-docker-app:latest"
  build {
    context = "../"   # points to your main project folder with Dockerfile
  }
}

resource "docker_container" "flask_app" {
  name  = "flask-app"
  image = docker_image.flask_app.image_id
  ports {
    internal = 5000
    external = 5000
  }
}
