variable "region" {
  type = string
}

variable "sagemaker_execution_role_arn" {
  type = string
}

variable "sagemaker_inference_image" {
  type = string
}

variable "s3_model_location" {
  type = string
}

variable "inference_instance_type" {
  type = string
}

variable "apprunner_image" {
  type = string
}

variable "apprunner_access_role_arn" {
  type = string
}

variable "apprunner_instance_role_arn" {
  type = string
}