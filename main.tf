    provider "aws" {
        region = "us-east-2"
    }

    resource "aws_s3_bucket" "terraform_state" {
    bucket = "warmup-running-state"

    # Prevent accidental deletion of this S3 bucket
    lifecycle {
        prevent_destroy = true
    }

    # Enable versioning so I can see the full revision history of
    # my state files
    versioning {
        enabled = true
    }

    # Enable server-side encryption by default
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
            see_algorithm = "AES256"
            }
        }
    }
    }

    resource "aws_dynamodb_table" "warmup_locks" {
        name = "warmup-running-locks"
        billing_mode = "PAY_PER_REQUEST"
        hash_key = "LockID" 

        attribute {
        name = "LockID"
        type = "S"
        }
    
    }