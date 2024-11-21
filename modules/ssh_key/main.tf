resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpIM16N7/D/YPWmlvi4sKiWdm2M6wJ2fUPFwiEjdjnCyS0hhMAEZFT1P0Js8Ww/VCNRCWZvOBMh7gEAPkM4qfaBpmrZxOIQ7Sno6QNLlVnacQ2a2fbWdSob2ao5Z1WGBiMOBeqb0IaXV2FLxQxwIdPRMZerHqNrUAHW+2jBlcrRd+rPGkx1M0CEghVi2sczZSxGdJg/RjB0KgYvTSU5MJUSe+i2hqmp3LvcMEcqJwiFnl5ql0giQLElEGdUsbh/dftDGjEi8EupmfLP64HthQFDBa2mjmYPOfh1s6hHMzv/upcBRZLHIMj0BxwL6EVfRDAWpl9/2ISdl3T9v2yYc5h sigmoid@sigmoid-ThinkPad-T450"
  #file("/home/sigmoid/.ssh/id_rsa.pub")
  # Use absolute path
}
