module "vpc"{
	source="../../../modules/vpc"
	vpc_cidr_block="10.240.0.0/16"
	public_subnet_cidr_list=["10.240.1.0/24","10.240.2.0/24","10.240.3.0/24"]
	private_app_subnet_list=["10.240.4.0/24","10.240.5.0/24","10.240.6.0/24"]
	private_db_subnet_list=["10.240.7.0/24","10.240.8.0/24","10.240.9.0/24"]
	vpc_seq_id="001"
	seq_id="001"
	environment="n"
	cost_centre="it"
	build_date="12082018"
	version_id="001"
}