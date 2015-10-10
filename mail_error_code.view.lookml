- view: mail_error_code
  fields:

  - dimension: mail_error_code_id
    primary_key: true
    type: int
    sql: ${TABLE}.mail_error_code_id

  - dimension: mail_error_code_text
    sql: ${TABLE}.mail_error_code_text

  - measure: count
    type: count
    drill_fields: [mail_error_code_id, docmail_list.count]

