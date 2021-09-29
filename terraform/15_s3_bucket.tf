resource "aws_s3_bucket" "my" {
  bucket = "my.${var.domain}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
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

resource "aws_s3_bucket_policy" "public_read" {
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

# resource "aws_s3_bucket_object" "webpage" {
#   key          = "index.html"
#   bucket       = aws_s3_bucket.site.id
#   source       = "./website/index.html"
#   content_type = "text/html"

#   etag = filemd5("./website/index.html")
# }