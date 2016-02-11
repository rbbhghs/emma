- view: outcomes
  fields:

  - dimension_group: appointment
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Appointment Date`

  - dimension: appointment_id
    type: int
    hidden: true
    sql: ${TABLE}.`Appointment ID`

  - dimension: appointment_type_name
    sql: ${TABLE}.`Appointment type name`

  - dimension: cumulative_effect
    type: number
    sql: ${TABLE}.`Cumulative effect (%)`

  - dimension_group: date_of_goal_creation
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Date of goal creation`

  - dimension: days_since_goal_creation
    type: int
    sql: ${TABLE}.`Days since goal creation`

  - dimension: diagnosis
    sql: ${TABLE}.Diagnosis

  - dimension: exercise_body_part
    sql: ${TABLE}.`Exercise body part`

  - dimension: exercise_frequency
    type: int
    sql: ${TABLE}.`Exercise frequency`

  - dimension: exercise_name
    sql: ${TABLE}.`Exercise name`

  - dimension: exercise_order
    type: int
    sql: ${TABLE}.`Exercise Order`

  - dimension: goal_description
    sql: ${TABLE}.`Goal description`

  - dimension: goal_id
    type: int
    hidden: true
    sql: ${TABLE}.`Goal ID`

  - dimension: goal_score_id
    type: int
    hidden: true
    sql: ${TABLE}.`Goal Score ID`

  - dimension_group: goal_target
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Goal target date`

  - dimension: goal_target_score
    type: number
    sql: ${TABLE}.`Goal target score`

  - dimension_group: initial_referral
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Initial referral date`

  - dimension: initial_score
    type: number
    sql: ${TABLE}.`Initial Score`

  - dimension: latest_score
    type: number
    sql: ${TABLE}.`Latest score`

  - dimension: marker_type
    sql: ${TABLE}.`Marker type`

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.`Patient ID`

  #- dimension: patient_name
  #  sql: ${TABLE}.`Patient name`

  - dimension: relative_effect_
    type: number
    sql: ${TABLE}.`Relative effect (%)`

  - dimension: score
    type: number
    sql: ${TABLE}.Score

  - dimension_group: score_recorded
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Score recorded date`

  - dimension: session_number
    type: number
    sql: ${TABLE}.`Session number`

  - dimension: target_vas_score
    type: number
    sql: ${TABLE}.`Target VAS score`

  - dimension: treatment_cycle_id
    type: int
    # hidden: true
    sql: ${TABLE}.`Treatment cycle ID`

  - dimension: treatment_owner
    sql: concat('Mr ', LEFT(${TABLE}.`Treatment owner`))

  - dimension: treatment_point
    sql: ${TABLE}.`Treatment point`

  - dimension: treatment_provider
    sql: ${TABLE}.`Treatment provider`

  - dimension: vas_score
    type: number
    sql: ${TABLE}.`VAS Score`

  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: count_sessions
    label: '# of Sessions'
    type: count_distinct
    sql: ${session_number}  
    sql_distinct_key: ${session_number}
    
  - measure: count_patients
    label: '# of Patients'
    type: count_distinct
    sql: ${patient_id}  
    sql_distinct_key: ${patient_id} 
    
    
  - measure: count_treatments
    label: '# of Treatments'
    type: count_distinct
    sql: ${treatment_cycle_id}  
    sql_distinct_key: ${treatment_cycle_id}   
    
  - measure: avg_sessions
    label: 'Avg # of Sessions'
    type: avg
    sql: ${session_number}  
    sql_distinct_key: ${session_number}
    value_format: '0.000'  

  - measure: avg_score
    label: 'Avg Score'
    type: avg
    sql: ${score}  
    value_format: '0.000'  
    
  - measure: avg_latest_score
    label: 'Avg Latest Score'
    type: avg
    sql: ${latest_score}  
    value_format: '0.000'  
    
    
  - measure: relative_effect_avg
    label: 'Relative effect (%)'
    type: number
    type: avg
    sql: ${relative_effect_} 
    value_format: '0.000'  

  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - patient_name
    - appointment_type_name
    - exercise_name
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - treatment_cycle.treatment_cycle_id
    - treatment_cycle.treatment_cycle_name
    - goal.goal_id
    - appointment.appointment_id
    - goal_score.goal_score_id
    - c_plan_activity_instance.count
    - smart_list_contact_plan_criterion.count

