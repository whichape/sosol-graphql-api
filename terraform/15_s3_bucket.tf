resource "aws_s3_bucket" "my" {
  bucket = "my.${var.domain}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "POST", "PUT", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "my_public_read" {
  bucket = aws_s3_bucket.my.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.my.arn,
          "${aws_s3_bucket.my.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_bucket" "sosol_prod" {
  bucket = var.aws_bucket
  acl    = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "POST", "PUT", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "sosol_prod_public_read" {
  bucket = aws_s3_bucket.sosol_prod.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = ""
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.sosol_prod.arn,
          "${aws_s3_bucket.sosol_prod.arn}/*",
        ]
      },
    ]
  })
}
# resource "aws_s3_bucket" "site" {
#   bucket = var.domain
#   acl    = "public-read"

#   website {
#     index_document = "index.html"
#     error_document = "index.html"
#   }
# }

# resource "aws_s3_bucket" "www" {
#   bucket = "www.${var.domain}"
#   acl    = "private"
#   policy = ""

#   website {
#     redirect_all_requests_to = "https://${var.domain}"
#   }
# }

