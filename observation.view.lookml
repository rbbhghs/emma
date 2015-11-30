- view: observation
  fields:

  - dimension: observation_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_id

  - dimension: abnormal_flag
    sql: ${TABLE}.abnormal_flag

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: observation_code
    sql: ${TABLE}.observation_code

  - dimension: observation_name
    sql: ${TABLE}.observation_name

  - dimension: observation_set_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_set_id

  - dimension: observation_value
    sql: ${TABLE}.observation_value

  - dimension: print_order
    sql: ${TABLE}.print_order

  - dimension: reference_range
    sql: ${TABLE}.reference_range

  - dimension: requires_review
    type: yesno
    sql: ${TABLE}.requires_review

  - dimension_group: result_received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.result_received

  - dimension: result_status
    sql: ${TABLE}.result_status

  - dimension: review_notes
    sql: ${TABLE}.review_notes

  - dimension_group: reviewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reviewed

  - dimension: reviewed_by_id
    type: int
    sql: ${TABLE}.reviewed_by_id

  - dimension: set_number
    type: int
    sql: ${TABLE}.set_number

  - dimension: units
    sql: ${TABLE}.units

  - dimension: value_type
    sql: ${TABLE}.value_type

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - observation_id
    - observation_name
    - observation_set.observation_set_id
    - observation_set.service_name
    - observation_set.ordered_by_name
    - emr2_note_entry.count
    - observation_note.count

