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
$ conftest test plan.json
```
