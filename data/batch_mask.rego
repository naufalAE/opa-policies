package trino

default batchColumnMasks := []

batchColumnMasks contains {
  "index": i,
  "viewExpression": {
    "expression": "NULL"
  }
} {
  some i
  col := input.action.filterResources[i].column
  not (input.context.identity.user == "admin")
  col.tableName == "customers"
  col.columnName == "ssn"
}
