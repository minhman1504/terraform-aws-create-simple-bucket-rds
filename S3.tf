resource "aws_s3_bucket" "app_filestorage" {
  bucket = "my-670966728611-bucket"
}

resource "aws_s3_bucket_policy" "allow_access_from_everywhere" {
  bucket = aws_s3_bucket.app_filestorage.id
  policy = file("policies/S3/bucket-access-policy.json")
}


output "S3-bucket-name" {
  value = aws_s3_bucket.app_filestorage.id
}


resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.app_filestorage.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["POST","GET","PUT","DELETE","HEAD"]
    allowed_origins = ["*"]
    expose_headers  = [""]
  }
}