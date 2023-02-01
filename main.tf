resource "aws_sagemaker_model" "m" {
  name               = "faster-rcnn-terraform"
  execution_role_arn = "arn:aws:iam::480352539845:role/sagemakergoodrole"

  primary_container {
    image = "763104351884.dkr.ecr.eu-west-1.amazonaws.com/pytorch-inference:1.8.1-cpu-py3"
    model_data_url = "s3://jumpstart-cache-prod-eu-west-1/pytorch-infer/v1.1.0/infer-pytorch-od1-fasterrcnn-resnet50-fpn.tar.gz"
  }
}



resource "aws_sagemaker_endpoint_configuration" "ec" {
  name = "endpoint-config-terraform"

  production_variants {
    variant_name           = "variant-1-terraform"
    model_name             = aws_sagemaker_model.m.name
    initial_instance_count = 1
    instance_type          = "ml.m5.large"
  }
}

resource "aws_sagemaker_endpoint" "e" {
  name                 = "faster-rcnn"
  endpoint_config_name = aws_sagemaker_endpoint_configuration.ec.name

}
