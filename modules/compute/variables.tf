variable subnet_id {
  type = string
}
variable sg_id {
  type = string
}

variable ami {
  default = "ami-0ba62214afa52bec7"
}

variable flavor {
  default = "t2.micro"
}

variable keyname {
  default = "test-19-07" 
}

variable instance_name {
  type = string
}
