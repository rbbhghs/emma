- view: derived_busy_duration
  derived_table:
    sql: |
      select diary_id,sum(TIMESTAMPDIFF(second,start,end)) total_busy_seconds from appointment_section where ifnull(busy_type_id,0) > 0 and status = 'A' group by diary_id;
    sql_trigger_value: SELECT CURDATE()
    indexes: [diary_id]      

  fields:
  - measure: total_busy_seconds
    type: sum 
    value_format: '#,##0'    
    drill_fields: detail*

  - measure: total_busy_minutes
    type: sum 
    sql: round(total_busy_seconds/60.00,2)
    value_format: '#,##0.00'    
    drill_fields: detail*

  - measure: total_busy_hours
    type: sum 
    sql: round(total_busy_seconds/3600.00,2)
    value_format: '#,##0.00'    
    drill_fields: detail*


  - dimension: diary_id
    type: int
    primary_key: true
    sql: ${TABLE}.diary_id

    
  sets:
    detail:
      - diary_id

