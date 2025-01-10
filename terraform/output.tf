output "iot_endpoint" {
  value = data.aws_iot_endpoint.endpoint.endpoint_address
}

output "certificate_pem" {
  value     = aws_iot_certificate.ocpp_gateway_cert.certificate_pem
  sensitive = true
}

output "private_key" {
  value     = aws_iot_certificate.ocpp_gateway_cert.private_key
  sensitive = true
}

data "aws_iot_endpoint" "endpoint" {
  endpoint_type = "iot:Data-ATS"
}
