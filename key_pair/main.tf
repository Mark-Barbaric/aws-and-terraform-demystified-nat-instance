resource "tls_private_key" "primary_key" {
    algorithm                       = var.rsa_algorithm
    rsa_bits                        = var.rsa_bits
}

resource "aws_key_pair" "main" {
    key_name                        = "${var.key_name}"
    public_key                      = tls_private_key.primary_key.public_key_openssh
    /*
    provisioner "local-exec" {
        command                     = "echo '${tls_private_key.primary_key.private_key_pem}' > ${var.key_name}.pem"
    }
    */
}