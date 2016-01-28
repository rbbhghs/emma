- view: derived_busy_duration
  derived_table:
    sql: |
      select diary_id,sum(TIMESTAMPDIFF(second,start,end))/3600 total_busy_hours from appointment_section where ifnull(busy_type_id,0) > 0 group by diary_id;

  fields:
  - measure: total_busy_hours
    type: sum
    drill_fields: detail*

  - dimension: diary_id
    type: int
    primary_key: true
    sql: ${TABLE}.diary_id
    
  sets:
    detail:
      - first_appointment_id
      - new_appointments
