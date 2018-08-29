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











