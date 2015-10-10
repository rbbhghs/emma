- view: treatment_cycle_names
  fields:

  - dimension: treatment_cycle_names_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_names_id

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

  - dimension: treatment_cycle_names_name
    sql: ${TABLE}.treatment_cycle_names_name

  - measure: count
    type: count
    drill_fields: [treatment_cycle_names_id, treatment_cycle_names_name]

