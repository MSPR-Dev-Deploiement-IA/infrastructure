locals {
  infra_outputs = jsondecode(file("config.json"))
}


resource "azurerm_container_registry_task" "tasks" {
  count                 = length(var.images)
  name                  = "${var.images[count.index].name}-task"
  container_registry_id = local.infra_outputs.acr_id.value

  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = var.images[count.index].path
    context_access_token = var.github_access_token
    image_names          = ["${var.images[count.index].name}"]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "run" {
  count                      = length(var.images)
  container_registry_task_id = azurerm_container_registry_task.tasks[count.index].id
}
