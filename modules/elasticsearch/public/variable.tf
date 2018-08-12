variable "environment"{
	description="indicates name of our environment. possible values dev,cit,sit,uat,pprod,prod,n"
	default="dev"
}

variable "cost_centre"{
	description="A part of an organization to which costs may be charged.e.g. finance/it/hr/wholesale/retail/investment etc..."
	default=""
}

variable "project"{
	description="project for which this component is created. one cost centre can have multiple projects"
	default=""
}

variable "app_service"{
	description="this represent functionality in project. one project can have multiple functionalities."
	default=""
}

variable "seq_id"{
	description="define unique number for the combination of environment,cost_centre,project and app_service."
	default=""
}

variable "region"{
	description="region in which resource is created."
	default="eu-west-1"
}

variable "compliance"{
	description="indication of compliance e.g. pcidss/none"
	default="none"
}

variable "confidentiality"{
	description="indication for data confidentiality. highly_confidential/internal/public"
	default="highly_confidential"
}

variable "version_id"{
	description="version of this component.everytime when we are updating this component we need to increment it."
	default=""
}

variable "build_date"{
	description="date on which this component built/modified. format ddmmyyyy e.g. 27122017"
	default=""
}

variable "maintainance_time"{
	description="defines time  on which maintainance allowed in 24hr format hhmm .e.g. 1330 i.e. 1 pm 30 minutes"
	default=""
}

variable "maintainance_day"{
	description="defines day on which maintainance allowed. mon/tue/wed/thu/fri/sat/sun"
	default="sun"
}

variable "es_version"{
	description="version of elastic search"
	default=""
}

variable "automated_snapshot_start_hour"{
	description="24 hour format for starting automated snapshot.it should be indeally time when less load on system."
	default="05"
}

variable "es_zone_awareness"{
	description="similar to multi AZ"
	default="false"
}

variable "es_instance_type"{
	description="type of elastic search instance type"
	default="m4.large.elasticsearch"
}

variable es_instance_count{
	description="total number of instances in cluster. if es_zone_awareness is true then we need to select it as even number"
	default="1"
}

variable dedicated_master_enabled{
	description="by default it is false."
	default="false"
}

variable dedicated_master_count{
	description="if dedicated_master_enabled then it can be 3 or 5"
	default=""
}

variable dedicated_master_type{
	description="type of master"
	default=""
}

# EBS Options
variable ebs_volume_size{
	description="size of EBS volume"
	default=""
}

variable ebs_volume_type{
	description="volume type. General purpose, PIOPS, Magentic."
	default="gp2"
}
