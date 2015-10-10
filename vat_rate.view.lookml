- view: vat_rate
  fields:

  - dimension: vat_rate_id
    primary_key: true
    type: int
    sql: ${TABLE}.vat_rate_id

  - dimension_group: effective
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.effective_date

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - dimension: vat_rate_code
    sql: ${TABLE}.vat_rate_code

  - dimension: vat_rate_percentage
    type: number
    sql: ${TABLE}.vat_rate_percentage

  - measure: count
    type: count
    drill_fields: [vat_rate_id]

