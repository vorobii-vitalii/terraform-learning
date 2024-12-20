provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "my_user" {
  name = "happy_user"
}

resource "aws_iam_policy" "policy" {
  name   = "s3_custom_policy"
  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "s3:ListAccessPointsForObjectLambda",
          "s3:GetObjectVersionTagging",
          "s3:ListStorageLensGroups",
          "s3:GetStorageLensConfigurationTagging",
          "s3:GetObjectAcl",
          "s3:GetBucketObjectLockConfiguration",
          "s3:GetIntelligentTieringConfiguration",
          "s3:GetStorageLensGroup",
          "s3:GetAccessGrantsInstanceForPrefix",
          "s3:GetObjectVersionAcl",
          "s3:GetBucketPolicyStatus",
          "s3:GetAccessGrantsLocation",
          "s3:GetObjectRetention",
          "s3:GetBucketWebsite",
          "s3:GetJobTagging",
          "s3:ListJobs",
          "s3:GetMultiRegionAccessPoint",
          "s3:GetObjectAttributes",
          "s3:GetAccessGrantsInstanceResourcePolicy",
          "s3:GetObjectLegalHold",
          "s3:GetBucketNotification",
          "s3:DescribeMultiRegionAccessPointOperation",
          "s3:GetReplicationConfiguration",
          "s3:ListMultipartUploadParts",
          "s3:GetObject",
          "s3:DescribeJob",
          "s3:GetAnalyticsConfiguration",
          "s3:GetObjectVersionForReplication",
          "s3:GetAccessPointForObjectLambda",
          "s3:GetStorageLensDashboard",
          "s3:GetLifecycleConfiguration",
          "s3:GetAccessPoint",
          "s3:GetInventoryConfiguration",
          "s3:GetBucketTagging",
          "s3:GetAccessPointPolicyForObjectLambda",
          "s3:ListCallerAccessGrants",
          "s3:GetBucketLogging",
          "s3:ListBucketVersions",
          "s3:GetAccessGrant",
          "s3:ListBucket",
          "s3:GetAccelerateConfiguration",
          "s3:GetObjectVersionAttributes",
          "s3:GetBucketPolicy",
          "s3:ListTagsForResource",
          "s3:GetEncryptionConfiguration",
          "s3:GetObjectVersionTorrent",
          "s3:GetBucketRequestPayment",
          "s3:ListAccessGrantsInstances",
          "s3:ListAccessGrants",
          "s3:GetAccessPointPolicyStatus",
          "s3:GetAccessGrantsInstance",
          "s3:GetObjectTagging",
          "s3:GetMetricsConfiguration",
          "s3:GetBucketOwnershipControls",
          "s3:GetBucketPublicAccessBlock",
          "s3:GetMultiRegionAccessPointPolicyStatus",
          "s3:ListBucketMultipartUploads",
          "s3:GetMultiRegionAccessPointPolicy",
          "s3:GetAccessPointPolicyStatusForObjectLambda",
          "s3:ListAccessPoints",
          "s3:GetDataAccess",
          "s3:GetBucketVersioning",
          "s3:ListMultiRegionAccessPoints",
          "s3:GetBucketAcl",
          "s3:GetAccessPointConfigurationForObjectLambda",
          "s3:ListAccessGrantsLocations",
          "s3:ListStorageLensConfigurations",
          "s3:GetObjectTorrent",
          "s3:GetMultiRegionAccessPointRoutes",
          "s3:GetStorageLensConfiguration",
          "s3:GetAccountPublicAccessBlock",
          "s3:ListAllMyBuckets",
          "s3:GetBucketCORS",
          "s3:GetBucketLocation",
          "s3:GetAccessPointPolicy",
          "s3:GetObjectVersion"
        ],
        "Resource": "*"
      }
    ]
  }
EOF

}

resource "aws_iam_policy_attachment" "policy_binding" {
  name       = "test_user_s3"
  users = [aws_iam_user.my_user.name]
  policy_arn = aws_iam_policy.policy.arn
}




