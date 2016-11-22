
variable "public_key_path" {
  default = ""
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = ""
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-b1cf19c6"
    eu-west-2 = "ami-21f78e11"
  }
}
