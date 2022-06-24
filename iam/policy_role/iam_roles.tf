###############################
# Role 1
############################### 

resource "aws_iam_role" "lambda-com-role" {
  name = "lambda-com-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

### Policy attachment
# attache IAM policy 1 
data "aws_iam_policy" "ses-policy" {
  arn = "arn:aws:iam::458109380959:policy/sendemail"
}
resource "aws_iam_role_policy_attachment" "role_ses_policy_attach" {
   role       = aws_iam_role.lambda-com-role.name
   policy_arn = data.aws_iam_policy.ses-policy.arn
}

# # attache IAM policy 2
# data "aws_iam_policy" "logs-read-policy" {
#   arn = "arn:aws:iam::458109380959:policy/CloudWatchLogsRead"
# }

# resource "aws_iam_role_policy_attachment" "role_logs_policy_attach" {
#    role       = aws_iam_role.lambda-com-role.name
#    policy_arn = data.aws_iam_policy.logs-read-policy.arn
# }

# attache IAM policy 3
data "aws_iam_policy" "ec2-describe" {
  arn = "arn:aws:iam::458109380959:policy/ec2describe"
}

resource "aws_iam_role_policy_attachment" "role_ec2-describe_attach" {
   role       = aws_iam_role.lambda-com-role.name
   policy_arn = data.aws_iam_policy.ec2-describe.arn
}

# attache IAM policy 4
resource "aws_iam_role_policy_attachment" "role_log-full-access_attach" {
   role       = aws_iam_role.lambda-com-role.name
   policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}


###############################
# Role 2
###############################

resource "aws_iam_role" "s3access-role" {
  name = "s3access-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# attache IAM policy 1
data "aws_iam_policy" "s3-policy" {
  arn = "arn:aws:iam::458109380959:policy/s3access"
}


resource "aws_iam_role_policy_attachment" "role_s3_aacess_attach" {
   role       = aws_iam_role.s3access-role.name
   policy_arn = data.aws_iam_policy.s3-policy.arn
}