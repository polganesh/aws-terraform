
resource "random_string" "main" {
  length = 10
  special = false
  upper=false
  number=false
  override_special = "/@\" "
}

resource "aws_s3_bucket" "main" {
  bucket = "s3.${var.environment}.${var.cost_centre}.${var.project}.${var.app_service}.${random_string.main.result}"
  acl    = "private"

  tags {
    Name        = "s3.${var.environment}.${var.cost_centre}.${var.project}.${var.app_service}.${random_string.main.result}"
    Environment = "${var.environment}"
	CostCentre="${var.cost_centre}"
	Project="${var.project}"
	ApplicationService="${var.app_service}"
	Region="${var.region}"
	Compliance="${var.compliance}"
	Confidentiality="${var.confidentiality}"
	VersionId="${var.version_id}"
	BuildDate="${var.build_date}"
	MaintainanceDay="${var.maintainance_day}"
	MaintainanceTime="${var.maintainance_time}"
 }
}

resource "aws_cloudfront_origin_access_identity" "main" {
  comment = "${var.cloudfront_origin_access_identity}"
}

data "aws_iam_policy_document" "main" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.main.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.main.iam_arn}"]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = ["${aws_s3_bucket.main.arn}"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.main.iam_arn}"]
    }
  }
}

resource "aws_s3_bucket_policy" "main" {
  bucket = "${aws_s3_bucket.main.id}"
  policy = "${data.aws_iam_policy_document.main.json}"
}

resource "aws_cloudfront_distribution" "s3_main_distribution" {
	aliases=["${var.aliases}"]
	price_class = "${var.cf_price_class}"
	comment="${var.cf_comment_for_distr}"
	default_root_object="${var.cf_default_root_object}" # it is normally page in s3 to be redirected e.g. index.html
	enabled="true"
	is_ipv6_enabled="${var.cf_is_ipv6_enabled}"
	
	origin {
		domain_name = "${aws_s3_bucket.main.bucket_domain_name}"
		origin_id   = "s3-${aws_s3_bucket.main.bucket_domain_name}"
		s3_origin_config {
			origin_access_identity = "${aws_cloudfront_origin_access_identity.main.cloudfront_access_identity_path}"
		}
	}
	
	/**
	we are not enabling logging config
	**/
	
	default_cache_behavior {
		allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
		cached_methods   = ["GET", "HEAD"]
		target_origin_id = "${local.s3_origin_id}"
		forwarded_values {
			query_string = false
			cookies {
				forward = "none"
			}
		}
		viewer_protocol_policy = "allow-all"
		min_ttl                = 0
		default_ttl            = 3600
		max_ttl                = 86400
	}
	# ordered_cache_behavior
	

	tags {
		Environment = "${var.environment}"
		CostCentre="${var.cost_centre}"
		Project="${var.project}"
		ApplicationService="${var.app_service}"
		Region="${var.region}"
		Compliance="${var.compliance}"
		Confidentiality="${var.confidentiality}"
		VersionId="${var.version_id}"
		BuildDate="${var.build_date}"
		MaintainanceDay="${var.maintainance_day}"
		MaintainanceTime="${var.maintainance_time}"
	}

}



