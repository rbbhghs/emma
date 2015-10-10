- view: email
  fields:

  - dimension: email_id
    primary_key: true
    type: int
    sql: ${TABLE}.email_id

  - dimension: body
    sql: ${TABLE}.body

  - dimension: body_html
    type: yesno
    sql: ${TABLE}.body_html

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension: email_template_id
    type: int
    # hidden: true
    sql: ${TABLE}.email_template_id

  - dimension: from_address
    sql: ${TABLE}.from_address

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: recipient_id
    type: int
    sql: ${TABLE}.recipient_id

  - dimension: subject
    sql: ${TABLE}.subject

  - dimension: to_address
    sql: ${TABLE}.to_address

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - email_id
    - email_template.email_template_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name

