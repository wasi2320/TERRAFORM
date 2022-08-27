variable vpc_cidr_block {
  description = "vpc cidr block"
}

variable subnet_public_cidr_block1 {
  description = "vpc cidr block"
}

variable subnet_public_cidr_block2 {
  description = "vpc cidr block"
}

variable subnet_private_cidr_block1 {
  description = "vpc cidr block"
}

variable subnet_private_cidr_block2 {
  description = "vpc cidr block"
}

variable env {
  description = "deployment"
}
variable ami {
  description = "ami for ec2"
}

variable instance_type {
  description = "size for the ec2"
}

variable key {
  description= "ssh key location"
}
