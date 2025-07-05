resource "aws_route53_record" "expense" {
    count = length(var.instances)
    zone_id = var.zone_id
    name = var.instances[count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instances[count.index]}-${var.environment}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [var.instances[count.index] == "frontend" && var.environment == "prod" ? aws_instance.ec2[count.index].public_ip : aws_instance.ec2[count.index].private_ip]
    allow_overwrite = true
}