package data_mask

default mask_fields = {}

mask_fields[table] = masked_fields {
  some table
  masked_fields := {
    "email": "****@****",
    "phone": "**********"
  }
  not allow_user_data
}
