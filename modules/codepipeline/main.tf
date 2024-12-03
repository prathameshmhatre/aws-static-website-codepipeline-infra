resource "aws_iam_role" "pipeline_role" {
  name               = "${var.pipeline_name}-codepipeline-role"
  assume_role_policy = jsonencode({
    Version : "2012-10-17"
    Statement : [
      {
        Effect : "Allow"
        Principal : {
          Service : "codepipeline.amazonaws.com"
        }
        Action : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "pipeline_policy" {
  role   = aws_iam_role.pipeline_role.name
  policy = jsonencode({
    Version : "2012-10-17"
    Statement : [
      {
        Effect   : "Allow"
        Action   : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "codedeploy:*",
          "codebuild:*",
          "cloudwatch:*",
          "iam:PassRole"
        ]
        Resource : "*"
      }
    ]
  })
}

resource "aws_codepipeline" "pipeline" {
  name     = var.pipeline_name
  role_arn = aws_iam_role.pipeline_role.arn

  artifact_store {
    location = var.artifact_store_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
    name             = "SourceAction"
    category         = "Source"
    owner            = "ThirdParty"
    provider         = "GitHub"
    version          = "1"
    output_artifacts = ["SourceArtifact"]

    configuration = {
      Owner      = var.github_owner
      Repo       = var.github_repo
      Branch     = var.github_branch
      OAuthToken = var.github_token
    }
  }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      version         = "1"
      input_artifacts = ["SourceArtifact"]

      configuration = {
        BucketName = var.s3_bucket_name
        Extract    = "true"
      }
    }
  }
}