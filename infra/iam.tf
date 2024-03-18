resource "aws_iam_role" "api_role" {
  name = "role_ecr"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })


  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "ecr_policy" {
  name        = "ecr_policy"
  path        = "/"
  description = "My ecr policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "ecr-policy-attachment" {
  name       = "ecr-policy-attachment"
  roles      = [aws_iam_role.api_role.name]
  policy_arn = aws_iam_policy.ecr_policy.arn
}

resource "aws_iam_instance_profile" "api_profile" {
  name = "api_profile"
  role = aws_iam_role.api_role.name
}
