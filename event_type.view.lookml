- view: event_type
  fields:

  - dimension: integral_event_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.integral_event_type_id

  - dimension: event_type
    sql: ${TABLE}.event_type

  - dimension: event_type_companies
    type: int
    sql: ${TABLE}.event_type_Companies

  - dimension: event_type_description
    sql: ${TABLE}.event_type_description

  - dimension: event_type_ext_practice
    type: yesno
    sql: ${TABLE}.event_type_ext_practice

  - dimension: event_type_ext_practitioners
    type: int
    sql: ${TABLE}.event_type_ext_practitioners

  - dimension: event_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.event_type_id

  - dimension: event_type_patients
    type: int
    sql: ${TABLE}.event_type_patients

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: event_status
    sql: ${TABLE}.status

  - dimension: event_type_category
    sql: CASE WHEN ${TABLE}.event_type_id in (7,8,9,10,11,25,30,92,93,111,112,132,133,134,201,213,239,240,241,242,243,244,245,246) then 'Appointments' 
              WHEN ${TABLE}.event_type_id in (223,224) then 'Workflow' 
              WHEN ${TABLE}.event_type_id in (1,2,3,6,26,82,91,94,106,141,142,170,175,180,196,197,198,199,200,201,206,218,222) then 'Patient Admin'
              WHEN ${TABLE}.event_type_id in (1,60,88,91,115,121,207,210) then 'Entity Creation' 
              else 'Other' End 

  - measure: count
    type: count
    drill_fields: [integral_event_type_id, event_type.integral_event_type_id, event.count, event_type.count]

