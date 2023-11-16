module "vpc" {
  source = "./modules/vpc"

  project_id = var.project_id
  vpc_name   = var.vpc_name
}

/*module "gke" {
  source           = "./modules/gke"
  project_id       = var.project_id
  zone             = var.us_south1_zone
  vpc_name         = module.vpc.vpc_id
  subnet_name      = module.vpc.us_south1_subnet_id
  gke_cluster_name = var.gke_cluster_name
  service_account  = var.service_account
  vm_machine_type  = var.vm_machine_type
}

module "lb" {
  source                  = "./modules/lb"
  project_id              = var.project_id
  region                  = var.region
  vpc_name                = module.vpc.vpc_id
  subnet                  = module.vpc.subnet_id
  kubernetes_cluster_name = module.gke.kubernetes_cluster_name
}

module "jenkins-vm" {
  source = "./modules/jenkins-vm"

  project_id            = var.project_id
  jenkins_instance_name = var.jenkins_instance_name
  vm_machine_type       = var.vm_machine_type
  zone                  = var.us_south1_zone
  vpc_name              = module.vpc.vpc_id
  subnet                = module.vpc.us_south1_subnet_id
  service_account       = var.service_account
  user_name             = var.user_name
  public_key            = var.public_key
  private_key           = var.private_key
  gke_cluster_name      = module.gke.kubernetes_cluster_name

  depends_on = [module.gke]
}*/

module "sonarqube-vm" {
  source = "./modules/sonarqube-vm"

  project_id          = var.project_id
  sonar_instance_name = var.sonar_instance_name
  vm_machine_type     = var.vm_machine_type
  zone                = var.us_south1_zone
  vpc_name            = module.vpc.vpc_id
  subnet              = module.vpc.us_south1_subnet_id
  service_account     = var.service_account
  user_name           = var.user_name
  public_key          = var.public_key
  private_key         = var.private_key

  depends_on = [module.vpc]
}
