variable "region" {
    default = "us-east-1"
}

variable "profile" {
    default = "vscode"
}

variable "shared_config_files" {
    default = "~/.aws/config"
}

variable "shared_credentials_files" {
    default = "~/.aws/credentials"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
    type  = list(string)
  default = ["10.0.0.0/20"]
}

variable "private_subnet_cidr_blocks" {
    type = list(string)
  default = ["10.0.128.0/20"]
}

variable "ami_id" {
  default = "ami-007855ac798b5175e"
}

variable "instance_type" {
  default = "t2.micro"
}



