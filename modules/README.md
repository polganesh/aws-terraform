# README #
Following are important variable and their possible values for creating AWS components with these modules.
Although it is not mandetory to follow exactly same values but these values help to set some guidelines and standardization for various AWS components.

## environment ##
* It represents envriornment for which this component made for. 
* length 1 to 3 chars
* all small case letters
* Possible values

Value  | Important Note
------------- | -------------
dev  | 	component for **Dev**elopment environment
cit  | 	component specific to **C**omponent **I**ntegration **T**esting
sit  | 	component specific to **S**ystem **I**ntegration **T**esting
uat  | 	component specific to **U**ser **A**cceptance **T**esting
pre	 | 	component specific to **Pre**prod environment
n    |	component which is **not** for production env
p    |	for **P**roduction environment

## cost_centre ##
* It represents entity which will own cost for AWS component.
*  Any org can have following cost centres. following values are indicative.
* all small case letters
* length 1 to 4 chars

Possible Cost Centres	|value
---------------------	|----
hr						|hr|
it						|it|
legal					|lgl|
finance					|fin|
wholesale				|whsl|
retail					|rtl|
manufacturing			|mfg|
banking					|bank|
investment				|inv|
marketing				|mkt|
 
