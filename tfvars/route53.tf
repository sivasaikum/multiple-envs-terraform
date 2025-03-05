resource "aws_route53_record" "security" {
    count = length(var.instances)
    zone_id =  var.zone_id
    name = var.instances [count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instances[count.index]}-${var.environment}.${var.domain_name}"  #interpolation
    type = "A"
    ttl = 1
    records = [var.instances [count.index] == "frontend" && var.environment == "prod" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
    
}


/* resource aws_route53_record "web" {
    zone_id =  var.zone_id
    name = var.domain_name  #interpolation
    type = "A"
    ttl = 1
    records = [aws_instance.expense[2].public_ip]
    allow_overwrite = true
} */