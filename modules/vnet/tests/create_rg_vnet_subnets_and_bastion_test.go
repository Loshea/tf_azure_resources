package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformRGVNETBastion(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/create_bastion",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	bastion_host_name := terraform.Output(t, terraformOptions, "bastion_host_name")

	assert.Equal(t, "tf-vnet1-bastion", bastion_host_name, "Bastion Host Name does not match.  Expected, expected tf-vnet1-bastion, found %s ", bastion_host_name)
}
