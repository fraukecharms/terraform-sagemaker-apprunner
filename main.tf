resource "aws_sagemaker_model" "m" {
  name               = "faster-rcnn-terraform"
  execution_role_arn = var.sagemaker_execution_role_arn

  primary_container {
    image          = var.sagemaker_inference_image
    model_data_url = var.s3_model_location
    environment    = { "SAGEMAKER_PROGRAM" : "inference.py", "SAGEMAKER_SUBMIT_DIRECTORY" : "code", "SAGEMAKER_REGION" : var.region }
  }
}



resource "aws_sagemaker_endpoint_configuration" "ec" {
  name = "endpoint-config-terraform"

  production_variants {
    variant_name           = "variant-1-terraform"
    model_name             = aws_sagemaker_model.m.name
    initial_instance_count = 1
    instance_type          = var.inference_instance_type
  }
}

resource "aws_sagemaker_endpoint" "e" {
  name                 = "faster-rcnn"
  endpoint_config_name = aws_sagemaker_endpoint_configuration.ec.name

}


resource "aws_apprunner_service" "apprunner" {
  service_name = "apprunner-terraform"

  source_configuration {
    image_repository {
      image_identifier      = var.apprunner_image
      image_repository_type = "ECR"
    }
    authentication_configuration {
      access_role_arn = var.apprunner_access_role_arn
    }
  }

  instance_configuration {
    instance_role_arn = var.apprunner_instance_role_arn

  }

}

