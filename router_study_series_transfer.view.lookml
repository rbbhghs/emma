- view: study_series_transfer
  fields:

  - dimension: id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end

  - dimension: img_avail
    type: int
    sql: ${TABLE}.img_avail

  - dimension: img_sent
    type: int
    sql: ${TABLE}.img_sent

  - dimension: router_job_id
    type: int
    hidden: true
    # hidden: true
    sql: ${TABLE}.router_job_id

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start

  - dimension: status
    sql: ${TABLE}.status

  - dimension: study_series_id
    type: int
    hidden: true
    # hidden: true
    sql: ${TABLE}.study_series_id
    

  - measure: count
    type: count
    drill_fields: [id, router_job.id, study_series.id]

