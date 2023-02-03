# First Steps with Terraform

Let's assume you have been through the "click-through experience" of creating the object detection demo in [this repo](https://github.com/fraukecharms/fastapi-sagemaker-compvision) at least once and you now want to automate part of the process with Terraform. Specifically, the first step of deploying the Sagemaker endpoint and the last step of creating an App Runner Service. 

Have a look at `terraform.tfvars` and fill in the variable values. The `model.tar.gz` file that `s3_model_location` specifies needs to contain the model data as well as the inference script `inference.py` in the directory `code`. This means that the `base_model_uri` from the sample notebook in the video won't work out of the box, since it doesn't contain the inference script (which is in `deploy_source_uri`). So if you want to deploy this model without fine-tuning, you need to either manually repackage it or deploy it via notebook once and save a copy before calling `base_model_predictor.delete_model()`.

After installing Terraform and the AWS CLI version 2, simply run this:

```shell
export AWS_PROFILE=<your profile>
terraform init
terraform apply
```

And to clean up:
```shell
terraform destroy
```



