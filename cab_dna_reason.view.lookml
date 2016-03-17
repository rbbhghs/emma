- view: cab_dna_reason
  fields:

  - dimension: cab_dna_reason_code
    type: int
    sql: ${TABLE}.cab_dna_reason_code

  - dimension: description
    sql: ${TABLE}.description

  - dimension: dna_reason
    sql: ${TABLE}.description

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

  - dimension: terminal
    type: yesno
    sql: ${TABLE}.terminal

  - measure: count
    type: count
    drill_fields: []

