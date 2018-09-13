module "ecscluster"{
	source="../../../modules/ecs/ecs-cluster"
	vpc_seq_id="001"
	seq_id="002"
	environment="dev"
	cost_centre="it"
	build_date="12082018"
	version_id="001"
	project="mytest"
	app_service="service"
	image_id="ami-0d256199b7cbf2e39"
	instance_type="m4.large"
	key_name="mykeypair"
	launch_config_sec_group_id="sg-0eed5d7539f79bc31"
	root_volume_size=50
	docker_ebs_volume_size=100
	max_size=4
	min_size=2
	desired_capacity=2
	access_key="${var.aws-access-key}"
	secret_key="${var.aws-secret-key}"
	maintenance_time="00:00"
	maintenance_day="Sun"
	instance_ebs_optimized=true

	# ecr_repos=["avc","vfvfg"]
}