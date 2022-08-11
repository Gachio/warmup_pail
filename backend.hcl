# backend.hcl
bucket = "warmup-running-state"
region = "us-east-2"
dynamodb_table = "warmup-running-locks"
encrypt = true