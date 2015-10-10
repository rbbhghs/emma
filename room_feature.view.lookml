- view: room_feature
  fields:

  - dimension: room_feature_id
    primary_key: true
    type: int
    sql: ${TABLE}.room_feature_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: room_feature_name
    sql: ${TABLE}.room_feature_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [room_feature_id, room_feature_name, appointment_type_participant_room_feature.count, room_room_feature.count]

