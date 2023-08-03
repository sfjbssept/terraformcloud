resource "aws_security_group" "terraform-cloud-nishant-group" {
  name        = "terraform-cloud-nishant-group"
  description = "terraform sg for ec2 instance"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  ingress {
    description = "allow ssh port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cide_block  = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow http port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cide_block  = ["0.0.0.0/0"]
  }
  egress {
    description = "outbound all allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cide_block  = ["0.0.0.0/0"]
  }
}