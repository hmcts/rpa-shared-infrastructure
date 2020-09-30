module "appGw" {
  source            = "git@github.com:hmcts/cnp-module-waf?ref=CHG5001024"
  env               = "${var.env}"
  subscription      = "${var.subscription}"
  location          = "${var.location}"
  wafName           = "${var.product}"
  resourcegroupname = "rpa-${var.env}"
  common_tags       = "${var.common_tags}"

  # vNet connections
  gatewayIpConfigurations = []

  sslCertificates = []

  # Http Listeners
  httpListeners = []

   # Backend address Pools
  backendAddressPools = []
  use_authentication_cert = true
  backendHttpSettingsCollection = []

  # Request routing rules
  requestRoutingRules = []

  probes = []
}
