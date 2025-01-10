# IoT Thing
resource "aws_iot_thing" "ocpp_gateway" {
  name = "${var.environment}-ocpp-gateway"
}

# IoT Certificate
resource "aws_iot_certificate" "ocpp_gateway_cert" {
  active = true
}

# IoT Policy
resource "aws_iot_policy" "ocpp_gateway_policy" {
  name = "${var.environment}-ocpp-gateway-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iot:Connect",
          "iot:Subscribe",
          "iot:Receive",
          "iot:Publish"
        ]
        Resource = [
          "arn:aws:iot:${var.aws_region}:${data.aws_caller_identity.current.account_id}:client/${var.environment}-*",
          "arn:aws:iot:${var.aws_region}:${data.aws_caller_identity.current.account_id}:topic/charging-stations/*"
        ]
      }
    ]
  })
}

# Attach certificate to thing
resource "aws_iot_thing_principal_attachment" "ocpp_gateway" {
  principal = aws_iot_certificate.ocpp_gateway_cert.arn
  thing     = aws_iot_thing.ocpp_gateway.name
}

# Attach policy to certificate
resource "aws_iot_policy_attachment" "ocpp_gateway_policy_attachment" {
  policy = aws_iot_policy.ocpp_gateway_policy.name
  target = aws_iot_certificate.ocpp_gateway_cert.arn
}
