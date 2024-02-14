resource "aws_instance" "instance" {
ami = "ami-0d442a425e2e0a743"
instance_type = "t3.micro"
availability_zone = "us-west-2a"
associate_public_ip_address = true
key_name = "vockey"
vpc_security_group_ids = ["sg-069bd1de910a21138"]
subnet_id = "subnet-0f7a0baa9ab24bc7b"
# iam_instance_profile = "LabRole”
count = 1
tags = {
Name = "Sandbox1"
}
}
