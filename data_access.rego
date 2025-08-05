package trino.access

default allow = false

user_roles := {
  "alice@example.com": "HR",
  "bob@example.com": "Finance",
  "admin@example.com": "Master"
}

allow_row contains true if {
  input.user == "admin@example.com"
}

allow_row contains true if {
  input.user == "bob@example.com"
  input.row.department == "Finance"
  input.row.salary <= 100000
}

allow_row contains true if {
  input.user == "alice@example.com"
}

mask_column contains "ssn" if {
  input.user == "alice@example.com"
}

mask_column contains "ssn" if {
  input.user == "bob@example.com"
}
