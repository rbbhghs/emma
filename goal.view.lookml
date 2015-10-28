- view: goal
  fields:

  - dimension: goal_id
    primary_key: true
    type: int
    sql: ${TABLE}.goal_id

  - dimension: body_part_id
    type: int
    # hidden: true
    sql: ${TABLE}.body_part_id

  - dimension_group: closed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.closed

  - dimension: closed_by_id
    type: int
    sql: ${TABLE}.closed_by_id

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.create_date

  - dimension: created_by
    sql: ${TABLE}.created_by

  - dimension: goal_description
    sql: ${TABLE}.goal_description

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: marker_type
    sql: ${TABLE}.marker_type

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: status
    sql: ${TABLE}.status

  - dimension_group: target
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.target_date

  - dimension: target_score
    type: number
    sql: ${TABLE}.target_score

  - dimension: target_vas_score
    type: number
    sql: ${TABLE}.target_vas_score

  - dimension: treatment_cycle_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - goal_id
    - body_part.body_part_id
    - body_part.name
    - treatment_cycle.treatment_cycle_id
    - treatment_cycle.treatment_cycle_name
    - goal_score.count
    - objective_marker.count
    - outcomes.count
    - subjective_marker.count

