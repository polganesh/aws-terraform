/* we need only lower case random string to be attached to s3 bucket.
it will improve performance of system
*/
resource "random_string" "main" {
  length = 10
  special = false
  upper=false
  number=false
  override_special = "/@\" "
}

resource "aws_s3_bucket" "main" {
  bucket = "s3.${var.environment}.${var.cost_centre}.${var.project}.${var.app_service}.${random_string.main.result}"
  acl    = "${var.acl_for_s3}"

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