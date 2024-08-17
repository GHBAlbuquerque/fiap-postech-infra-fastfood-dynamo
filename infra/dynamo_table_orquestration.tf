resource "aws_dynamodb_table" "orquestration-dynamodb-table" {
  name           = "Orquestration"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "sagaId"

  attribute {
    name = "sagaId"
    type = "S"
  }

#  attribute {
#    name = "stepId"
#    type = "S"
#  }

  attribute {
    name = "orderId"
    type = "S"
  }

  #  attribute {
  #    name = "createdAt"
  #    type = "S"
  #  }


  global_secondary_index {
    name               = "OrderIdIndex"
    hash_key           = "orderId"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["sagaId"]
  }

  tags = {
    Name        = "orquestration-dynamodb-table"
    Environment = "fiap-pos-tech"
  }
}