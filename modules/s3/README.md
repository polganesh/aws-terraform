# README #
This is standard module for creating S3 bucket
it will create s3 bucket with name s3environment.cost_centre.project.app_service.<10-char-random-string>

## Required Input Variables ##

variables	|
-------------
environment	|
cost_centre	|
project		|
app_service	|

{var.environment}.${var.cost_centre}.${var.project}.${var.app_service}


## Optional Input Variables ##

variables	|
------------------------------------------------------------------------------------------------------------------------------------------------------------------|
acl_for_s3	|default is private. possible values public-read/public-read-write/aws-exec-read/authenticated-read .... for more option refer terraform documentation|


