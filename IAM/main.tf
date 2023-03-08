# resource "aws_iam_policy" "code_bucket_policy" {
#   name        = "code-bucket-policy"
#   path        = "/"
#   description = "Allow "

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "VisualEditor0",
#         "Effect" : "Allow",
#         "Action" : [
#             "s3:*"
#         ],
#         "Resource" : "*"
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "ssm_policy" {
#   name        = "ssm-policy"
#   path        = "/"
#   description = "SSM Access"

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "VisualEditor0",
#         "Effect" : "Allow",
#         "Action" : [
#             "ssm:*"
#         ],
#         "Resource" : "*"
#       }
#     ]
#   })
# }

resource "aws_iam_role" "WebApp_Instance" {
  name = "S3_Access"
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
#   depends_on = [aws_iam_policy.code_bucket_policy]  
}

resource "aws_iam_role_policy_attachment" "s3_access_policy" {
  role       = aws_iam_role.WebApp_Instance.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  depends_on = [aws_iam_role.WebApp_Instance]
}

resource "aws_iam_role_policy_attachment" "ssm_access_policy" {
  role       = aws_iam_role.WebApp_Instance.name
  # policy_arn = aws_iam_policy.ssm_policy.arn
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  depends_on = [aws_iam_role.WebApp_Instance]
}

resource "aws_iam_instance_profile" "s3_access_profile" {
  name = "s3_access_profile"
  role = aws_iam_role.WebApp_Instance.name
  depends_on = [aws_iam_role.WebApp_Instance]
}