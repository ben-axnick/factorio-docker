CloudFormation {
  BUCKET = "factorio.#{DOMAIN}"

  S3_Bucket("Bucket") {
    BucketName BUCKET
  }

  S3_BucketPolicy('BucketPolicy') {
    Bucket BUCKET
    PolicyDocument \
      Statement: [{
      Action: ["s3:GetObject"],
      Effect: "Allow",
      Resource: "*"
    }]
  }
}
