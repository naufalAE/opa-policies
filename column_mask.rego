package trino

# Default allow for DML/DQL operations
default allow := true

# Only “admin” sees raw data
is_admin { input.context.identity.user == "admin" }

# Example: mask SSN for non‑admins on table “customers”
columnMask := {"expression": "NULL"} {
  not is_admin
  input.action.resource.column.tableName == "customers"
  input.action.resource.column.columnName == "ssn"
}

# Example: partially mask email, showing domain only
columnMask := {
  "expression": "regexp_replace(email, '^[^@]+', '***')"
} {
  not is_admin
  input.action.resource.column.tableName == "customers"
  input.action.resource.column.columnName == "email"
}
