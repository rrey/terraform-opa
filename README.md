# Terraform & OPA

## Quickstart

```
make test
```

## Generate Terraform plan

```
$ terraform plan -out plan.out
```

## Generate the JSON plan

```
terraform show -json plan.out > plan.json
```

## Test the plan against a policy

```
opa eval --data rego --data ./rego/terraform.rego --input ./plan.json "data.terraform.analysis.deny_instance_without_owner_label"
```
