- view: appointment_type_participant
  fields:

  - dimension: appointment_type_participant_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_type_participant_id

  - dimension: appointment_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: participant_description
    sql: ${TABLE}.participant_description

  - dimension: participant_order
    type: int
    sql: ${TABLE}.participant_order

  - dimension: use_primary_participant_room
    type: yesno
    sql: ${TABLE}.use_primary_participant_room

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_type_participant_id
    - appointment_type.appointment_type_id
    - appointment_type.appointment_type_name
    - appointment_type_participant_room_feature.count
    - appointment_type_participant_speciality.count
    - appointment_type_section.count

