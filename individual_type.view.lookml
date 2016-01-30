- view: individual_type
  fields:

  - dimension: individual_type_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.individual_type_id

  - dimension: individual_type_name
    sql: ${TABLE}.individual_type_name

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

  - measure: count
    type: count
    hidden: true
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - individual_type_id
    - individual_type_name
    - click_tracking_aggregated.count
    - communication_preference_entity.count
    - communication_reminder_preference_entity.count
    - individual.count
    - individual_type_access_link.count

