resource "aws_instance" "instance" {
ami = "ami-0d442a425e2e0a743"
instance_type = "t3.micro"
availability_zone = "us-west-2c"
associate_public_ip_address = true
key_name = "vockey"
vpc_security_group_ids = ["sg-0474c38a77b7cfdbe"]
subnet_id = "subnet-0afa1c8e7708ded4a"
# iam_instance_profile = "LabRole”
count = 1
tags = {
Name = "Sandbox1"
}
}