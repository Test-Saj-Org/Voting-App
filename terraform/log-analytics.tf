resource "azurerm_log_analytics_workspace" "Log_Analytics_Space" {
    name = var.logan_name
    resource_group_name = "${azurerm_resource_group.aks_rg.name}"
    location = "centralindia"
    sku = "PerGB2018"
}

resource "azurerm_log_analytics_solution" "Log_Analytics_Sol_container_insight" {
    solution_name = "container_insignts"
    location = "centralindia"
    resource_group_name = "${azurerm_resource_group.aks_rg.name}"
    workspace_resource_id = azurerm_log_analytics_workspace.Log_Analytics_Space.id
    workspace_name = azurerm_log_analytics_workspace.Log_Analytics_Space.name

    plan {
        publisher = "Microsof"
        product = "OMSGallery/ContainerInsights"
    } 
}