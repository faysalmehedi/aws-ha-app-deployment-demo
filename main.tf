resource "aws_sns_topic" "demo" {
  name = var.topic_name
  tags = {
    Team = var.Team
  }
}
resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.demo.arn
  protocol  = var.protocol_type
  endpoint  = var.endpoint
}