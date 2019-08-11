[![CircleCI](https://circleci.com/gh/devops-workflow/terraform-github-team-members.svg?style=svg)](https://circleci.com/gh/devops-workflow/terraform-github-team-members)

terraform-github-team-members
=======================

Terraform module for managing Github team membership

```hcl
module "team-members" {
  source  = "devops-workflow/team-members/github"
  version = "0.0.1"
  team_id = "12345"

  users = [
    {
      username  = "user1"
    },
    {
      username  = "user2"
      role-team = "maintainer"
    },
  ]
}
```
