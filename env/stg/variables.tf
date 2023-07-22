##Access key
variable "access_key" {
  description = "Access key"
  type        = string
}

##Secret Key
variable "secret_key" {
  description = "Secret Key"
  type        = string
}

##General Config
variable "general_config" {
  type = map(any)
  default = {
    project = "example"
    env     = "stg"
  }
}

##Regions
variable "regions" {
  default = {
    tokyo    = "ap-northeast-1"
    virginia = "us-east-1"
  }
}

##Network
variable "vpc" {
  description = "CIDR BLOCK for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type = map(any)
  default = {
    availability_zones = {
      az-1a = {
        az = "ap-northeast-1a"
      },
      az-1c = {
        az = "ap-northeast-1c"
      }
    }
  }
}

variable "public_subnets" {
  type = map(any)
  default = {
    subnets = {
      public-1a = {
        name = "public-1a",
        cidr = "10.0.10.0/24",
        az   = "ap-northeast-1a"
      },
      public-1c = {
        name = "public-1c",
        cidr = "10.0.30.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "dmz_subnets" {
  type = map(any)
  default = {
    subnets = {
      dmz-1a = {
        name = "dmz-1a",
        cidr = "10.0.20.0/24",
        az   = "ap-northeast-1a"
      },
      dmz-1c = {
        name = "dmz-1c",
        cidr = "10.0.40.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    subnets = {
      private-1a = {
        name = "private-1a"
        cidr = "10.0.50.0/24"
        az   = "ap-northeast-1a"
      },
      private-1c = {
        name = "private-1c"
        cidr = "10.0.70.0/24"
        az   = "ap-northeast-1c"
      }
    }
  }
}

##Security Group CIDR
variable "operation_sg_1_cidr" {
  default = ["0.0.0.0/0"]
}

variable "operation_sg_2_cidr" {
  default = ["0.0.0.0/0"]
}

variable "operation_sg_3_cidr" {
  default = ["0.0.0.0/0"]
}

##EC2
variable "ami" {
  description = "ID of AMI to use for ec2 instance"
  default     = "ami-0bba69335379e17f8"
}

variable "instance_type" {
  description = "Instance type of EC2"
  type        = string
  default     = "t3.micro"
}

variable "volume_type" {
  description = "Root block device of EC2"
  type        = string
  default     = "gp2"
}

variable "volume_size" {
  description = "Root block device size of EC2"
  default     = 100
}

variable "key_name" {
  description = "Key pair's name"
  type        = string
}

variable "public_key_path" {
  description = "Public key path. For example: ~/.ssh/terraform.pub"
  type        = string
}

##IAM Account ID
variable "iam_account_id" {
  description = "IAM account id for S3 bucket's principal"
  type        = string
}

##Route53
#variable "primary_zone" {
#  description = "Primary zone name. For example: example.com"
#  type        = string
#  default     = "example.com"
#}

variable "zone_id" {
  description = "Zone id on Route53"
  type        = string
  default     = "Z07403921OYE516WPU79B"
}

##ACM
variable "domain_name" {
  description = "Domain name for ACM"
  type        = string
  default     = "onya-lab.site"
}

variable "sans" {
  description = "Subject alternative names for ACM"
  type        = string
  default     = "*.onya-lab.site"
}

##RDS Option Group
variable "engine_name" {
  type    = string
  default = "mysql"
}

variable "major_engine_version" {
  type    = string
  default = "8.0"
}

##RDS Instance
variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0"
}

variable "username" {
  description = "root username of db instance"
  type        = string
}

variable "password" {
  description = "root password of db instance"
  type        = string
}

variable "instance_class" {
  description = "The class of db instance"
  type        = string
  default     = "db.t3.medium"
}

variable "storage_type" {
  description = "The storage type of db instance"
  type        = string
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The allocated storage of db instance"
  default     = 20
}

variable "multi_az" {
  description = "multi az of db instance"
  type        = string
  default     = "true"
}

##SNS
variable "sns_email" {
  description = "email address for sns"
  type        = string
}

##Cloud Watch Alearm Actions
variable "cwa_actions" {
  description = "CloudWatch alearm actions"
  type        = string
  default     = "false"
}

##Cloud Watch Threshold for RDS
variable "cwa_threshold_rds_freeablememory" {
  description = "threshold of freeable memory on rds"
  type        = number
  #3.3GB
  default = 3543348019
}

variable "cwa_threshold_rds_freeablestorage" {
  description = "threshold of freeable storage on rds"
  type        = number
  #17GB
  default = 18253611008
}

##ECR Image Name
variable "repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "ecs_cicd_terraform-image"
}

##Docker Image Name
variable "image_name" {
  description = "Dockerimage name"
  type        = string
  default     = "takahiros991/ecs_cicd_terraform-image"
}

##Dockerfile Directory
#variable "docker_dir" {
#  description = "directory where the Dockerfile is"
#  type = string
#  default     = "."
#}

##Fargate CPU
variable "fargate_cpu" {
  description = "fargate cpu"
  type        = string
  default     = "256"
}

##Fargate Memory
variable "fargate_memory" {
  description = "fargate memory"
  type        = string
  default     = "512"
}

##IAM ECS
variable "role_name_1" {
  description = "ECS IAM role name"
  type        = string
  default     = "role-fargate_task_execution"
}

variable "policy_name_1" {
  description = "ECS IAM policy name"
  type        = string
  default     = "fargate_task_execution"
}

##IAM Codebuild
variable "role_name_2" {
  description = "Codebuild IAM role name"
  type        = string
  default     = "role-codebuild-service-role"
}

variable "policy_name_2" {
  description = "Codebuild IAM policy name"
  type        = string
  default     = "build-policy"
}

##IAM Codepipeline
variable "role_name_3" {
  description = "Codepipeline IAM role name"
  type        = string
  default     = "role-codepipeline-service-role"
}

variable "policy_name_3" {
  description = "Codepipeline IAM policy name"
  type        = string
  default     = "pipeline-policy"
}

##IAM Codepipeline Event Bridge
variable "role_name_4" {
  description = "Codepipeline Event Bridge IAM role name"
  type        = string
  default     = "role-codepipeline-event-bridge-service-role"
}

variable "policy_name_4" {
  description = "Codepipeline Event Bridge IAM policy name"
  type        = string
  default     = "pipeline-event-bridge-policy"
}

##Codepipeline Codecommit Branch Name
variable "branch_name" {
  description = "Codepipeline Codecommit branch name"
  type        = string
  default     = "main"
}

##Codecommit Repository Name
variable "code_repository_name" {
  description = "Codecommit Repository Name"
  type        = string
  default     = "example-repository"
}