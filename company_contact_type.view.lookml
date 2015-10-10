- view: company_contact_type
  fields:

  - dimension: company_contact_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.company_contact_type_id

  - dimension: company_contact_type_name
    sql: ${TABLE}.company_contact_type_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [company_contact_type_id, company_contact_type_name, company_contact.count]

