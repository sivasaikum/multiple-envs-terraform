resource "aws_instance" "demo" {
    ami             = "ami-09c813fb71547fc4f"
    instance_type   = lookup(var.env, terraform.workspace)
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
        Name = "terraform-demo1-${terraform.workspace}"
    }
}


resource "aws_security_group" "allow_tls" {
    name            = "allow_tls_${terraform.workspace}"
    description     = "Allow TLS all inbound & outbound traffic"

    ingress {
        from_port = 22
        to_port   = 22
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