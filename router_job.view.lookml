- view: router_job
  fields:

  - dimension: id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.id

  - dimension_group: datetime
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.datetime

  - dimension: destination_accession
    sql: ${TABLE}.destination_accession

  - dimension: destination_ae_id
    type: int
    hidden: true
    sql: ${TABLE}.destination_ae_id

  - dimension: destination_mrn
    sql: ${TABLE}.destination_mrn

  - dimension: img_count
    type: int
    sql: ${TABLE}.img_count

  - dimension: img_in_count
    type: int
    sql: ${TABLE}.img_in_count

  - dimension_group: img_in_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.img_in_end

  - dimension_group: img_in_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.img_in_start

  - dimension: img_out_count
    type: int
    sql: ${TABLE}.img_out_count

  - dimension_group: img_out_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.img_out_end

  - dimension_group: img_out_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.img_out_start

  - dimension: source_ae_id
    type: int
    hidden: true
    sql: ${TABLE}.source_ae_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: study_id
    type: int
    hidden: true
    # hidden: true
    sql: ${TABLE}.study_id

  - dimension: study_instance_uid
    sql: ${TABLE}.study_instance_uid

  - measure: count
    type: count
    drill_fields: [id, study.id, study_series_transfer.count]

