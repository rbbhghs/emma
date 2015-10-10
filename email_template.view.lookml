- view: email_template
  fields:

  - dimension: email_template_id
    primary_key: true
    type: int
    sql: ${TABLE}.email_template_id

  - dimension: attachment_allow
    type: int
    sql: ${TABLE}.attachment_allow

  - dimension: company_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_id

  - dimension: email_body
    sql: ${TABLE}.email_body

  - dimension: email_from
    sql: ${TABLE}.email_from

  - dimension: email_subject
    sql: ${TABLE}.email_subject

  - dimension: email_template_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.email_template_group_id

  - dimension: ical_attach
    type: yesno
    sql: ${TABLE}.ical_attach

  - dimension: ical_description
    sql: ${TABLE}.ical_description

  - dimension: ical_summary
    sql: ${TABLE}.ical_summary

  - dimension: language_id
    type: int
    # hidden: true
    sql: ${TABLE}.language_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - email_template_id
    - email_template_group.email_template_group_id
    - email_template_group.email_template_group_name
    - company.company_name
    - language.language_id
    - email.count

