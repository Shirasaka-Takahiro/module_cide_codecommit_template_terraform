##Cloudwatch ALB
resource "aws_cloudwatch_metric_alarm" "cwa_alb_unhealthyhostcount" {
  alarm_name          = "${var.general_config["project"]}-${var.general_config["env"]}-${var.alb_name}-UnHealthyHostCount"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  statistic           = "Average"
  period              = 300
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  treat_missing_data  = "notBreaching"
  actions_enabled     = var.cwa_actions
  alarm_actions       = [var.sns_topic_arn]
  ok_actions          = [var.sns_topic_arn]
  dimensions = {
    TargetGroup  = var.tg_arn_suffix
    LoadBalancer = var.alb_arn_suffix
  }
}

##Cloudwatch RDS
resource "aws_cloudwatch_metric_alarm" "cwa_rds_cpuutilization" {
  alarm_name          = "${var.general_config["project"]}-${var.general_config["env"]}-${var.rds_identifier}-CPUUtilization"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  statistic           = "Average"
  period              = 300
  threshold           = 80
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  treat_missing_data  = "notBreaching"
  actions_enabled     = var.cwa_actions
  alarm_actions       = [var.sns_topic_arn]
  ok_actions          = [var.sns_topic_arn]
  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "cwa_rds_freeablememory" {
  alarm_name          = "${var.general_config["project"]}-${var.general_config["env"]}-${var.rds_identifier}-FreeableMemory"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  statistic           = "Average"
  period              = 300
  threshold           = var.cwa_threshold_rds_freeablememory
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  treat_missing_data  = "notBreaching"
  actions_enabled     = var.cwa_actions
  alarm_actions       = [var.sns_topic_arn]
  ok_actions          = [var.sns_topic_arn]
  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "cwa_rds_freeablestorage" {
  alarm_name          = "${var.general_config["project"]}-${var.general_config["env"]}-${var.rds_identifier}-FreeableStorage"
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  statistic           = "Average"
  period              = 300
  threshold           = var.cwa_threshold_rds_freeablestorage
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  treat_missing_data  = "notBreaching"
  actions_enabled     = var.cwa_actions
  alarm_actions       = [var.sns_topic_arn]
  ok_actions          = [var.sns_topic_arn]
  dimensions = {
    DBInstanceIdentifier = var.rds_identifier
  }
}

##Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "deafult" {
  name              = "/${var.general_config["project"]}/${var.general_config["env"]}/web01"
  retention_in_days = 30
}

##Cloudwatch Event Rule for Codecommit
resource "aws_cloudwatch_event_rule" "codepipeline_event_rule" {
  name = "${var.general_config["project"]}-${var.general_config["env"]}-codepipeline-event_rule"

  event_pattern = templatefile("${path.module}/pattern/codepipeline_event_pattern.json", {
    codecommit_repository_arn = var.codecommit_repository_arn
  })
}

##Cloudwatch Event Target for Codecommit
resource "aws_cloudwatch_event_target" "codepipeline_event_target" {
  rule     = aws_cloudwatch_event_rule.codepipeline_event_rule.name
  arn      = var.codepipeline_arn
  role_arn = var.codepipeline_event_bridge_arn
}