# README #
* This is standard module for creating public facing Elastic Search with Kibana in  AWS.
* It will create Elastic Search Domain with Name  bucket with name <environment>-<cost_centre>-<project>-<app_service>-<seq_id>


## Required Input Variables ##

variable  	|
------------|
environment	|
cost_centre	|
project		|
app_service	|


## Optional Input Variables ##

variables				| Notes |
------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
es_version				| Indicates Elastic Search version to install.Default is 1.5. Possible values 6.3, 6.2, 6.0, 5.6, 5.5, 5.3, 5.1, 2.3, and 1.5. please refer AWS documentation for updates|
es_zone_awareness		|Similar to Multi AZ. by default it is false.																															|
es_instance_type		|supported instance types at https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-supported-instance-types.html|
es_instance_count		|if zone awareness enabled then it must be even number|
dedicated_master_enabled|it is by default false. for prod environment it should be true for stability|
dedicated_master_count	|it can be either 3 or 5|
dedicated_master_type   |supported instance types at https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-supported-instance-types.html|
ebs_volume_size			|if it is greater than 0 i.e.zero then Elastic Search will use Elastic Block storage|
ebs_volume_type			|gp,piops.... etc|
access_policies			|access policy|  


## Tags added to Elastic Search ##

Tag Name			|
--------------------|
Domain				|
Environment 		|
CostCentre			|
Project				|
ApplicationService	|
Region				|
Compliance			|
Confidentiality		|
VersionId			|
BuildDate			|

## Usage ##
