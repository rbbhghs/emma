- view: available_product
  fields:

  - dimension: available_product_id
    primary_key: true
    type: int
    sql: ${TABLE}.available_product_id

  - dimension: appointment_letter_template_id
    type: int
    sql: ${TABLE}.appointment_letter_template_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension_group: effective
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effective

  - dimension_group: expires
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expires

  - dimension: is_group
    type: yesno
    sql: ${TABLE}.is_group

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: parent_id
    type: int
    sql: ${TABLE}.parent_id

  - dimension: product_id
    type: int
    # hidden: true
    sql: ${TABLE}.product_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - available_product_id
    - contract.contract_id
    - contract.contract_name
    - product.product_id
    - product.product_name
    - charge.count
    - cm_policy.count
    - dicom_procedure_group.count

