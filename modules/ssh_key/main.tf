resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = file("/home/sigmoid/.ssh/id_rsa.pub")
  # Use absolute path
}
