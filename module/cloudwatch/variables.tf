variable "general_config" {
  type = map(any)
}
variable "cwa_actions" {}
variable "sns_topic_arn" {}
variable "alb_name" {}
variable "alb_arn_suffix" {}
variable "tg_arn_suffix" {}
variable "rds_identifier" {}
variable "cwa_threshold_rds_freeablememory" {}
variable "cwa_threshold_rds_freeablestorage" {}
variable "codepipeline_arn" {}
variable "codepipeline_event_bridge_arn" {}
variable "codecommit_repository_arn" {}