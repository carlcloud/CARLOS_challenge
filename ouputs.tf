output "challenge_static_website" {
  value = aws_route53_record.challenge_record.name
}