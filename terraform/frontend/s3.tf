resource "aws_s3_bucket" "stf_s3_bucket" {
    bucket = var.s3_bucket_name
    acl = "public-read"

    website {
        index_document = "index.html"
        error_document = "error.html"
    }

    tags = {
        Name        = "s3-hosting-bucket"
        Environment = "prod"
    }
}

data "aws_iam_policy_document" "stf_s3_bucket_policy_document" {
    statement {
        sid = "stf_sid_1"

        actions = [
            "s3:GetObject"
        ]

        principals {
            type =  "*"
            identifiers = ["*"]
        }

        resources = [
            "${aws_s3_bucket.stf_s3_bucket.arn}/*"
        ]
    }
}

resource "aws_s3_bucket_policy" "stf_s3_bucket_policy" {
    bucket = aws_s3_bucket.stf_s3_bucket.bucket
    policy = data.aws_iam_policy_document.stf_s3_bucket_policy_document.json
}
