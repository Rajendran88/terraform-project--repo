# Security Groups
resource "aws_security_group" "_sg_http"{
    vpc_id = aws_vpc.dev_vpc.id
    name = "nf_securityGrouplatest"
    tags = {
        Name = "nf_sg_http"
    }     
}