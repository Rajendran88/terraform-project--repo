# Security Groups
resource "aws_security_group" "my_sg_http"{
    vpc_id = aws_vpc.dev_vpc.id
    name = "my_securityGrouplatest"
    tags = {
        Name = "my_sg_http"
    }     
}
# Ingress Security Port 80 (Inbound)
resource "aws_security_group_rule" "my_ingress_http"{
    from_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.my_sg_http.id
    to_port= 80
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"] # <Specify the CIDR> instead of allowing it to public
}
# Ingress Security Port 443 (Inbound)
resource "aws_security_group_rule" "my_ingress_https"{
    from_port = 443
    protocol = "tcp"
    security_group_id = aws_security_group.my_sg_http.id
    to_port= 443
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"] # <Specify the CIDR> instead of allowing it to public
}
# Allow Access All (Outbound)
resource "aws_security_group_rule" "my_outbound_all"{
    from_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.my_sg_http.id
    to_port= 0
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
}