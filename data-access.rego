package trino.access

default allow = false

user_roles = {
  "alice@example.com": "HR",
  "bob@example.com": "Finance"
}

allow_row[true] {
  input.user == "bob@example.com"
  input.row.department == "Finance"
  input.row.salary <= 100000
}

allow_row[true] {
  input.user == "alice@example.com"
}

mask_column["ssn"] {
  input.user == "alice@example.com"
}

mask_column["ssn"] {
  input.user == "bob@example.com"
}
