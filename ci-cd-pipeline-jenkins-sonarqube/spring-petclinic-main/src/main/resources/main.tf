# RSA key of size 4096 bits
resource "tls_private_key" "xfusion-kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
  
}

local_file "xfusion-kp-pem" {
  content  = tls_private_key.xfusion-kp.private_key_pem
  filename = "${path.module}/xfusion-kp.pem"
}


