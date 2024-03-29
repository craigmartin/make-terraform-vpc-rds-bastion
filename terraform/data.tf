# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones#attributes-reference
data "aws_availability_zones" "zones" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids#attributes-reference
data "aws_subnet_ids" "subnets" {
  vpc_id = module.vpc.vpc_id

  depends_on = [
    module.vpc
  ]
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group
data "aws_security_group" "vpc_security_group" {
  id = module.vpc.default_security_group_id
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc#attributes-reference
data "aws_vpc" "vpc" {
  id = module.vpc.vpc_id
}

data "http" "my_ip" {
  url = "https://ifconfig.me"
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name = "name"
    # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type (first line of Amazon Linux AMI)
    values = ["amzn2-ami-kernel-5*-x86_64-gp2"]

    # Amazon Linux 2 AMI (HVM) - Kernel 4.14, SSD Volume Type (second line of Amazon Linux AMI)
    # values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}