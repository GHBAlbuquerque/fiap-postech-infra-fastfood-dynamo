resource "aws_dynamodb_table" "item-dynamodb-table" {
  name           = "Item"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "orderId"
  range_key      = "productId"

  attribute {
    name = "orderId"
    type = "S"
  }

  attribute {
    name = "productId"
    type = "S"
  }

#  attribute {
#    name = "quantity"
#    type = "N"
#  }

  attribute {
    name = "itemValue"
    type = "N"
  }

  global_secondary_index {
    name               = "ItemValueIndex"
    hash_key           = "orderId"
    range_key          = "itemValue"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["productId"]
  }


  tags = {
    Name        = "item-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}