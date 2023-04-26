resource "aws_s3_bucket" "djangoblog_bucket" {
  bucket = "django-blog-1234"

  tags = {
    Name        = "djangoblog"
  }
}

resource "aws_s3_bucket_cors_configuration" "djangoblog_s3_cors" {
  bucket = aws_s3_bucket.djangoblog_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
  }
}

resource "aws_s3_bucket_policy" "djangoblog_bucket_policy" {
  bucket = aws_s3_bucket.djangoblog_bucket.id
  policy = data.aws_iam_policy_document.djangoblog_policy.json
}

data "aws_iam_policy_document" "djangoblog_policy" {
  statement {
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.djangoblog_bucket.arn}/*"]
    effect = "Allow"
  }
}