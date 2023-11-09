resource "aws_ecr_repository" "ecr" {
  for_each             = toset(var.ecr_names)
  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

data "aws_iam_policy_document" "eks_image_pull_policy" {
  for_each = toset(var.ecr_names)

  statement {
    sid    = "AllowEKSPull"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = var.eks_cluster_iam_role_arns
    }
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer"
    ]
    resources = [aws_ecr_repository.ecr[each.key].arn]
  }
}

resource "aws_ecr_repository_policy" "eks_image_pull" {
  for_each   = toset(var.ecr_names)
  repository = aws_ecr_repository.ecr[each.key].name
  policy     = data.aws_iam_policy_document.eks_image_pull_policy[each.key].json
}
