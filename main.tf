# terraform-datadog-users

# https://www.terraform.io/docs/providers/datadog/r/user.html

module "enabled" {
  source  = "devops-workflow/boolean/local"
  version = "0.1.2"
  value   = "${var.enabled}"
}

# Support 1 team with many users
# Future if possible: multiple teams each with multiple different users
resource "github_team_membership" "this" {
  count    = "${module.enabled.value ? length(var.users) : 0}"
  team_id  = "${var.team_id}"
  username = "${lookup(var.users[count.index], "username")}"
  role     = "${lookup(var.users[count.index], "role-team", "member")}"

  # member or maintainer
}
