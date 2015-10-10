- view: time_zone
  fields:

  - dimension: time_zone_id
    primary_key: true
    type: int
    sql: ${TABLE}.time_zone_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - dimension: name
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [time_zone_id, name, location.count]

