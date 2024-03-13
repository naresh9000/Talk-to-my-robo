resource "aws_iam_role" "eks-admin" {
  name = "eks-cluster-eks-admin"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks-admin-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-admin.name
}

resource "aws_eks_cluster" "chat-gpt" {
  name     = "chat-gpt"
  role_arn = aws_iam_role.eks-admin.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-ap-south-2a.id,
      aws_subnet.private-ap-south-2b.id,
      aws_subnet.public-ap-south-2a.id,
      aws_subnet.public-ap-south-2b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks-admin-AmazonEKSClusterPolicy]
}
