resource "aws_security_group" "griff_sec-groups" {
  name        = "griff_allow_rules"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.griff-exiting-vpc.id
 
  tags = {
    Name = "griff_firewall_rules"
  }
}
# allow all outgoing ports for ipv4
 
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.griff_sec-groups.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

