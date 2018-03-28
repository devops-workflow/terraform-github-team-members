module "org-members" {
  source  = "devops-workflow/members/github"
  version = "0.1.0"
  users   = "${var.users-org}"

  providers = {
    github = "github.devops"
  }
}

module "team" {
  source  = "devops-workflow/teams/github"
  version = "0.0.1"

  providers = {
    github = "github.devops"
  }

  teams = [
    {
      name        = "team-everyone"
      description = "Team for Terraform testing"
    },
    {
      name        = "team-test"
      description = "Team for Terraform testing"
    },
  ]
}

module "team-everyone" {
  source  = "../../"
  team_id = "${element(module.team.ids, index(module.team.names, "team-everyone"))}"
  users   = "${var.users-org}"

  providers = {
    github = "github.devops"
  }
}

module "team-test" {
  source  = "../../"
  team_id = "${element(module.team.ids, index(module.team.names, "team-test"))}"

  providers = {
    github = "github.devops"
  }

  users = [
    {
      username  = "user-1"
      role-team = "maintainer"
    },
    {
      username = "user-2"
    },
    {
      username = "user-3"
    },
  ]
}
