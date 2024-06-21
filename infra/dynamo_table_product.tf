resource "aws_dynamodb_table" "product-dynamodb-table" {
  name           = "Product"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
  range_key      = "name"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "name"
    type = "S"
  }

  attribute {
    name = "price"
    type = "N"
  }

  attribute {
    name = "description"
    type = "S"
  }

  attribute {
    name = "type"
    type = "S"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }

  attribute {
    name = "updatedAt"
    type = "S"
  }

#  ttl {
#    attribute_name = "leaveDate"
#    enabled        = false
#  }

  global_secondary_index {
    name               = "ProductIndex"
    hash_key           = "price"
    range_key          = "type"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["id"]
  }

  tags = {
    Name        = "product-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}