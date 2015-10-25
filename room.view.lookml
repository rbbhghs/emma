- view: room
  fields:

  - dimension: room_id
    primary_key: true
    type: int
    sql: ${TABLE}.room_id

  - dimension: dicom_ae_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_ae_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: room_name
    sql: ${TABLE}.room_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - room_id
    - room_name
    - location.location_name
    - location.billing_location_id
    - dicom_ae.dicom_ae_id
    - dicom_ae.station_name
    - dicom_ae.host_name
    - class.count
    - diary.count
    - room_room_feature.count

