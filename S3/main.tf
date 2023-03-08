resource "aws_s3_bucket" "code-bucket" {
  bucket = "code-bucket-repo"
}
resource "aws_s3_bucket_object" "code-bucket-object" {
    for_each = fileset("./S3/countercode/", "*")
    bucket = aws_s3_bucket.code-bucket.id
    key = each.value
    source = "./S3/countercode/${each.value}"
    etag = filemd5("./S3/countercode/${each.value}")
}

output "bucketdetails" {
  value = aws_s3_bucket_object.code-bucket-object
}