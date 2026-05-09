# ECR Module

Creates one or more Amazon ECR repositories for application images.

The module also creates an IAM managed policy that grants full access to the managed repositories. Attach it to the IAM user, role, or group used by Jenkins when Jenkins needs to push images to ECR.

## Example

```hcl
module "ecr" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/ecr?ref=v1.4.0"

  project_name = "microservices-demo-app"
  environment  = "DEV"

  repository_names = [
    "microapps/auth-service",
    "microapps/catalog-service"
  ]

  full_access_iam_user_names = [
    "pradeep-IAM"
  ]

  tags = {
    Owner = "platform-team"
  }
}
```
