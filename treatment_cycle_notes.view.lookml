- view: treatment_cycle_notes
  fields:

  - dimension: treatment_cycle_notes_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_notes_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: treatment_cycle_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_id

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [treatment_cycle_notes_id, treatment_cycle.treatment_cycle_id, treatment_cycle.treatment_cycle_name]

