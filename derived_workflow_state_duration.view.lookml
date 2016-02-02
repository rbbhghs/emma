- view: derived_workflow_state_duration
  derived_table:
    sql: |
      select e.event_type_id,e.event_id from_event_id,e.created,e.treatment_cycle_referral_id,ws_from.name from_workstate,ws_to.name next_workstate,
      min(e1.event_id) to_event_id,min(e1.created) next_state_date,
      time_to_sec(timediff(min(e1.created),e.created)) state_duration
      from event e 
      JOIN event e1 ON (e1.event_id > e.event_id and e1.treatment_cycle_referral_id = e.treatment_cycle_referral_id) 
      JOIN workflow_state ws_from ON (ws_from.workflow_state_id = e.from_id) 
      JOIN workflow_state ws_to ON (ws_to.workflow_state_id = e.to_id)
      where e.from_id > 0 and e.to_id > 0 
      and e1.from_id > 0 and e1.to_id > 0 
      and e1.event_type_id = 223 
      group by e.event_type_id,e.event_id,e.created,e.treatment_cycle_referral_id;

  fields:
  - measure: state_duration
    type: sum
    drill_fields: detail*

  - measure: event_id
    type: count
    drill_fields: detail*
    
  - dimension: from_event_id
    type: int
    primary_key: true
    sql: ${TABLE}.from_event_id

  - dimension: from_workstate
    sql: ${TABLE}.event_id
    
  - dimension: next_workstate
    sql: ${TABLE}.event_id    

#  - dimension: new_appointments
#    type: int
#    sql: ${TABLE}.new_appointments

  sets:
    detail:
      - from_event_id
      - from_workstate
      - next_workstate
      - state_duration
