variable "devops_token" {
  description = "Github personal access token with owner rights for organization devops-workflow"
}

variable "users-org" {
  description = "All organization members"

  default = [
    {
      username = "user-1"
    },
    {
      username = "user-2"
      role-org = "admin"
    },
    {
      username  = "user-3"
      role-team = "maintainer"
    },
  ]
}
