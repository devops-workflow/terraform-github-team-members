module "org-members" {
  source  = "devops-workflow/members/github"
  version = "0.0.1"

  providers = {
    github = "github.devops"
  }

  users = [
    {
      username = "user1"
    },
    {
      username = "user2"
      role     = "owner"
    },
  ]
}

module "team" {
  source  = "devops-workflow/teams/github"
  version = "0.0.1"

  providers = {
    github = "github.devops"
  }

  teams = [
    {
      name        = "team-test"
      description = "Team for Terraform testing"
    },
  ]
}

module "team-members" {
  source     = "../../"
  depends_on = ["module.org-members", "module.team"]
  team_id    = "${element(module.team.ids, 0)}"

  providers = {
    github = "github.devops"
  }

  users = [
    {
      username = "user1"
    },
    {
      username = "user2"
      role     = "maintainer"
    },
  ]
}
