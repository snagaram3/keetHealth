output "instance_ip_addr" {
  value = aws_instance.keet_instance.private_ip
}

output "internal_ips" {
  value = docker_container.keetNGINX.*.internal_ip
}
