package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformRGVNETBastionOverrideHostName(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/create_bastion_override_host_name",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	bastion_host_name := terraform.Output(t, terraformOptions, "bastion_host_name")

	assert.Equal(t, "tf-vnet1-override-bastion-host", bastion_host_name, "Bastion Host Name does not match.  Expected, expected tf-vnet1-override-bastion-host, found %s ", bastion_host_name)
}
