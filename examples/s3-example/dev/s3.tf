module "s3"{
	source="../../../modules/s3"
	environment="dev"
	cost_centre="it"
	project="infra"
	app_service="infra"
	compliance="none"
	confidentiality="confidential"
	build_date="31072018"
	maintainance_day="sun"
	maintainance_time="0001"
	version_id="001"
}