- view: invoice_reissue_reason
  fields:

  - dimension: invoice_reissue_reason_id
    primary_key: true
    type: int
    sql: ${TABLE}.invoice_reissue_reason_id

  - dimension: invoice_reissue_reason_name
    sql: ${TABLE}.invoice_reissue_reason_name

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

  - measure: count
    type: count
    drill_fields: [invoice_reissue_reason_id, invoice_reissue_reason_name, invoice.count]

