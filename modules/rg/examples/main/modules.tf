
module "rg1" {
  source   = "git::https://github.com/Loshea/tf_azure_resources.git//modules/rg?ref=v0.14.0"
  rg_name  = "tf_rg1"
  location = "East US"
}
