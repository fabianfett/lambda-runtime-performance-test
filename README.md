## HelloWorldLambda

Building the package:

```bash
# build the image to compile the lambda first
$ docker build -t fabianfett/amazonlinux-swift:5.1.4-amazonlinux2-dev .

# compile the lambda
$ make package_lambda

# use the lambda.zip for tests - handler name is not taken into consideration

# test lambda locally
$ sam invoke local

# deploy with sam
# you'll need to have an s3 bucket as an intermediate resource store for the deployment
$ sam deploy --s3-bucket REPLACE_WITH_YOUR_BUCEKT_NAME --stack-name FFLambdaRuntimePerformanceTest --capabilities CAPABILITY_IAM
```
