- view: room_room_feature
  fields:

  - dimension: room_room_feature_id
    primary_key: true
    type: int
    sql: ${TABLE}.room_room_feature_id

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

  - dimension: room_id
    type: int
    # hidden: true
    sql: ${TABLE}.room_id

  - measure: count
    type: count
    drill_fields: [room_room_feature_id, room.room_id, room.room_name, room_feature.room_feature_id, room_feature.room_feature_name]

