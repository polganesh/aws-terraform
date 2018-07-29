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
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev" /dev/uat/sit/cit/prprd/prod/n
	Owner=it/retail/investment/wholesale --similar to business unit
	Project="main project name"
	ApplicationService=""
	
	
	BuildDate
	Version
	
  }
}