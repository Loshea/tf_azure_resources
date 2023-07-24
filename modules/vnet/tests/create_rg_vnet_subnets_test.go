package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformRGVNET(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/main",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	vnet := terraform.Output(t, terraformOptions, "vnet_name")
	//snets := terraform.Output(t, terraformOptions, "subnets")
	assert.Equal(t, "tf-vnet1", vnet)
	// assert.Contains(t, snets, "default", "default subnet not created")
	// assert.Contains(t, snets, "AzureBastionSubnet", "Bastion subnet not created")
	// assert.Contains(t, snets, "GatewaySubnet", "Gateway subnet not created")
}
