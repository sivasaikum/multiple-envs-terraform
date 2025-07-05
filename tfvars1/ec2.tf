resource "aws_instance" "ec2" {
    count = length(var.instances)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg.id]

    tags = merge(
        var.common_tags,
        {
            Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
        }
    )
}





resource "aws_security_group" "sg" {
    name = "${var.project}-${var.environment}"
    description = "Allowing all the traffic for testing"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge (
        var.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        }
    )
    
}