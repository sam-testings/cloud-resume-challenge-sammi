variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "prefix" {
  type        = string
  description = "The prefix to be added to resource names"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags you want applied to all components."
}

variable "bucket_name" {
  description = "Defines name for S3 bucket"
  type        = string
  default     = "sammi-site"
}

variable "domain_name" {
    type = string
    description = "the domain name for the website"
}
