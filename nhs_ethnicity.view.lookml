- view: nhs_ethnicity
  fields:

  - dimension: ethnicity_code
    sql: ${TABLE}.ethnicity_code

  - dimension: ethnicity_id
    type: int
    sql: ${TABLE}.ethnicity_id

  - dimension: ethnicity_name
    sql: ${TABLE}.ethnicity_name

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
    drill_fields: [ethnicity_name]

