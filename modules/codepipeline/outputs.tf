output "pipeline_name" {
  value       = aws_codepipeline.pipeline.name
  description = "Name of the CodePipeline"
}

output "pipeline_id" {
  value       = aws_codepipeline.pipeline.id
  description = "ID of the CodePipeline"
}