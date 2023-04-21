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
  default = "10.0.0.0/24"
}

variable "public_web_subnet_cidr_blocks" {
    type  = list(string)
  default = ["10.0.0.0/28", "10.0.0.16/28"]
}

variable "private_app_subnet_cidr_blocks" {
    type = list(string)
  default = ["10.0.0.128/28", "10.0.0.144/28"]
}

variable "private_db_subnet_cidr_blocks" {
    type = list(string)
  default = ["10.0.0.160/28", "10.0.0.176/28"]
}

variable "az" {
    type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "ami_id" {
  default = "ami-007855ac798b5175e"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_key_pair_name" {
  default = "Django"
}

variable "number_of_instances" {
  default = 1
}

variable "ip" {
  description = "My IP"
}

variable "db_pass" {
  description = "DB pass"
}

variable "db_user" {
  description = "DB user"
}