resource "aws_dynamodb_table" "checkout-dynamodb-table" {
  name           = "Checkout"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
  range_key      = "orderId"


  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "orderId"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  #  attribute {
  #    name = "createdAt"
  #    type = "S"
  #  }


  global_secondary_index {
    name               = "ChekoutStatusIndex"
    hash_key           = "orderId"
    range_key          = "status"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  tags = {
    Name        = "checkout-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}