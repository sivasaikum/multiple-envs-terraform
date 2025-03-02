resource "aws_instance" "expense" {
    count = length(var.instances)
    ami             = "ami-09c813fb71547fc4f"
    instance_type   = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
        Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
    }

    /* tags = merge (var.common_tags,{
        Name = var.instance_name[count.index]
    }
    ) */
}


resource "aws_security_group" "allow_tls" {
    name            = "${var.project}-${var.environment}"
    description     = "Allow TLS all inbound & outbound traffic"

    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 3306
        to_port   = 3306
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port   = 8080
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_tls"
    }
}