variable "ami"{
    type        = string
    description = "AMI to use on the keet_instance"
}
variable "instance_type"{
    type        = string
    description = "Type of the instance"
    default     = "t2.micro"
}
