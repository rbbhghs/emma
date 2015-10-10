- view: issuing_company_payment_detail
  fields:

  - dimension: issuing_company_payment_detail_id
    primary_key: true
    type: int
    sql: ${TABLE}.issuing_company_payment_detail_id

  - dimension: instructions
    sql: ${TABLE}.instructions

  - dimension: issuing_company_id
    type: int
    # hidden: true
    sql: ${TABLE}.issuing_company_id

  - dimension: issuing_company_payment_detail_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.issuing_company_payment_detail_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [issuing_company_payment_detail_id, issuing_company.issuing_company_id, issuing_company.issuing_company_name, issuing_company_payment_detail_type.issuing_company_payment_detail_type_id, issuing_company_payment_detail_type.name]

