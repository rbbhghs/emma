- view: dashboard_event

  fields:
  - measure: count
    type: count
    drill_fields: detail*
  
  - measure: datetime
    type: date_time
    sql: cast(${TABLE}.created as datetime)
    
  - measure: date
    type: date_time
    sql: cast(${TABLE}.created as datetime)  
    
  - measure: average_date
    type: date
    sql: AVG(${TABLE}.created)  
    
  - measure: min_date
    type: date
    sql: MIN(${TABLE}.created)  
    
  - measure: max_date
    type: date
    sql: MAX(${TABLE}.created)    

  - dimension: patient_id
    type: number
    sql: ${TABLE}.patient_id

  - dimension: dashboard_view_id
    sql: ${TABLE}.dashboard_view_id

  - dimension: dashboard_action_id
    type: number
    sql: ${TABLE}.dashboard_action_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: deleted
    sql: ${TABLE}.deleted='0'

  - dimension: deleted_by_id
    sql: ${TABLE}.deleted_by_id

  - dimension: treatment_cycle_referral_id
    type: number
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: charge_id
    sql: ${TABLE}.charge_id

  - dimension: dashboard_event_follow_up_id
    sql: ${TABLE}.dashboard_event_follow_up_id

  - dimension: appointment_id
    sql: ${TABLE}.appointment_id

  - dimension: last_modified_by
    hidden: yes
    sql: ${TABLE}.last_modified_by

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.last_modified

  - dimension: modified_by_function
    hidden: yes
    sql: ${TABLE}.modified_by_function
    

  sets:
    detail:
      - dashboard_event_id
      - patient_id
      - dashboard_view_id
      - dashboard_action_id
      - comments
      - created
      - created_by_id
      - deleted
      - deleted_by_id
      - treatment_cycle_referral_id
      - charge_id
      - dashboard_event_follow_up_id
      - appointment_id
      - last_modified_by
      - last_modified
      - modified_by_function
