- view: goal_score
  fields:

  - dimension: goal_score_id
    primary_key: true
    type: int
    sql: ${TABLE}.goal_score_id

  - dimension: appointment_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_id

  - dimension_group: create
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.create_date

  - dimension: goal_id
    type: int
    hidden: true
    sql: ${TABLE}.goal_id

  - dimension: is_clinician
    type: yesno
    sql: ${TABLE}.is_clinician

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: note
    sql: ${TABLE}.note

  - dimension: score
    type: number
    sql: ${TABLE}.score

  - dimension: status
    sql: ${TABLE}.status

  - dimension: treatment_point
    sql: ${TABLE}.treatment_point

  - dimension: vas_score
    type: number
    sql: ${TABLE}.vas_score
    
  - measure: max_score
    label: 'Max score'
    type: number
    sql: max(${total_price}) 
    
  - measure: avg_score
    label: 'Avg score'
    type: avg
    sql_distinct_key: ${score_id}
    sql: ${score}   

  - measure: count
    type: count
    drill_fields: [goal_score_id, goal.goal_id, appointment.appointment_id, outcomes.count]

