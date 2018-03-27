module "disabled" {
  source  = "../../"
  enabled = false
  team_id = "12345"
  users   = []

  providers = {
    github = "github.devops"
  }
}
