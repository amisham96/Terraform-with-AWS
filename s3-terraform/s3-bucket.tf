resource "aws_s3_bucket" "mybucket-amit07" {
  bucket = "mybucket-amit07"
}

resource "aws_s3_bucket_acl" "s3-acl" {
  bucket = aws_s3_bucket.mybucket-amit07.id
#   acl = "private"
  acl    = "private"
}