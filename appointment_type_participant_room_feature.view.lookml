- view: appointment_type_participant_room_feature
  fields:

  - dimension: appointment_type_participant_room_feature_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_type_participant_room_feature_id

  - dimension: appointment_type_participant_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_participant_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: room_feature_id
    type: int
    # hidden: true
    sql: ${TABLE}.room_feature_id

  - measure: count
    type: count
    drill_fields: [appointment_type_participant_room_feature_id, appointment_type_participant.appointment_type_participant_id, room_feature.room_feature_id, room_feature.room_feature_name]

