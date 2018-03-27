variable "enabled" {
  description = "Set to false to prevent the module from creating anything"
  default     = true
}

variable "team_id" {
  description = "Team ID"
}

variable "users" {
  description = "List of member user maps to manage in team"
  type        = "list"
}
