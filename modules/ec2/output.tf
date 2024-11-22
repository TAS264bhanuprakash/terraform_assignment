output "public_ip" {
  value = aws_instance.nginx_public.public_ip
}

output "private_ec2_private_ip" {
  value       = aws_instance.nginx_private.private_ip
}
