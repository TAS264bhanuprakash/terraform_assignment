vpc_cidr          = "10.0.0.0/16"
subnet_cidr       = "10.0.1.0/24"
availability_zone = "us-west-1a"
ami_id            = "ami-0da424eb883458071"
instance_type     = "t2.micro"
key_name          = "my-key"
public_key_path   = "~/.ssh/id_rsa.pub"
name              = "nginx-app"