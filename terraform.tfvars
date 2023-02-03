region = "eu-west-1"

sagemaker_execution_role_arn = "arn:aws:iam::480352539845:role/sagemakergoodrole"

sagemaker_inference_image = "763104351884.dkr.ecr.eu-west-1.amazonaws.com/pytorch-inference:1.8.1-cpu-py3"

s3_model_location = "s3://sagemaker-eu-west-1-480352539845/faster-rcnn-backup-model/model.tar.gz"

inference_instance_type = "ml.m5.large"


apprunner_image = "480352539845.dkr.ecr.eu-west-1.amazonaws.com/visiondemo-sagemaker:latest"

apprunner_access_role_arn = "arn:aws:iam::480352539845:role/service-role/AppRunnerECRAccessRole"

apprunner_instance_role_arn = "arn:aws:iam::480352539845:role/apprunner-sagemaker-instance-role-jan2023"