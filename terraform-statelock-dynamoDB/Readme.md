1. Create a s3 bucket to initialize the backend.
2. create a table in dynamo DB and create partition key named "LockID" and type "string".
3. Add below code in your terraform block:

   backend "s3" {
    bucket = "<Your_bucket_name>"
    key    = "<path to create terraform state file>"
    region = "<Your_region>"
    dynamodb_table = "<Your_dynamoDB_table_name>"
  }

4. Do terraform init with backed config by using below command
   
   terraform init -backend-config="access_key=<your access key>" -backend-config="secret_key=<your secret key>"

5. Do terraform apply and check dynamo DB table

6. while terraform is craeting the resources open another cli and try terraform plan you will get an error saying state file is lock