
plan.out:
	terraform plan -out plan.out

plan.json: plan.out
	terraform show -json plan.out > plan.json

.PHONY: test
test: plan.json
	opa eval --data rego --data ./rego/terraform.rego --input ./plan.json "data.terraform.analysis.deny_instance_without_owner_label"
	opa eval --data rego --data ./rego/terraform.rego --input ./plan.json "data.terraform.analysis.deny_firewall_ingress_openbar"
	opa eval --data rego --data ./rego/terraform.rego --input ./plan.json "data.terraform.analysis.deny_firewall_ingress_icmp"
