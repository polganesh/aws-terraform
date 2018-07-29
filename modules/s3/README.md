# README #
* This is standard module for creating S3 bucket
*It will create s3 bucket with name s3environment.cost_centre.project.app_service.<10-char-random-string>

## Required Input Variables ##

variable  	|
------------|
environment	|
cost_centre	|
project		|
app_service	|


## Optional Input Variables ##

variables	| Notes |
------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
acl_for_s3	|default is private. possible values public-read/public-read-write/aws-exec-read/authenticated-read .... for more option refer terraform documentation|

## Tags added to S3 Bucket ##

Tag Name			|
--------------------|
Name				|
Environment 		|
CostCentre			|
Project				|
ApplicationService	|
Region				|
Compliance			|
Confidentiality		|
VersionId			|
BuildDate			|
MaintainanceDay		|
MaintainanceTime	|
