- view: practitioner_type
  fields:

  - dimension: practitioner_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.practitioner_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: practitioner_type_name
    sql: ${TABLE}.practitioner_type_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [practitioner_type_id, practitioner_type_name, external_practitioner.count]

