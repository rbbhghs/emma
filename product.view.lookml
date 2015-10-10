- view: product
  fields:

  - dimension: product_id
    primary_key: true
    type: int
    sql: ${TABLE}.product_id

  - dimension: appointment_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_id

  - dimension: barcode
    sql: ${TABLE}.barcode

  - dimension: ccsd_code
    sql: ${TABLE}.ccsd_code

  - dimension: class_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.class_type_id

  - dimension: credit_amount
    type: yesno
    sql: ${TABLE}.credit_amount

  - dimension: drug_id
    type: int
    sql: ${TABLE}.drug_id

  - dimension_group: expires
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expires

  - dimension: hide_name_on_insurance_invoice
    type: yesno
    sql: ${TABLE}.hide_name_on_insurance_invoice

  - dimension: is_group
    type: yesno
    sql: ${TABLE}.is_group

  - dimension: is_restricted
    type: yesno
    sql: ${TABLE}.is_restricted

  - dimension: is_stockable
    type: int
    sql: ${TABLE}.is_stockable

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: no_aggregate_on_invoice
    type: yesno
    sql: ${TABLE}.no_aggregate_on_invoice

  - dimension: observation_service_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_service_id

  - dimension: pack_size
    type: number
    sql: ${TABLE}.pack_size

  - dimension: parent_id
    type: int
    sql: ${TABLE}.parent_id

  - dimension: product_name
    sql: ${TABLE}.product_name

  - dimension: require_comments
    type: yesno
    sql: ${TABLE}.require_comments

  - dimension: sage_reference
    sql: ${TABLE}.sage_reference

  - dimension: short_code
    sql: ${TABLE}.short_code

  - dimension: variable_amount
    type: yesno
    sql: ${TABLE}.variable_amount

  - dimension: vat_rate_code
    sql: ${TABLE}.vat_rate_code

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - product_id
    - product_name
    - appointment_type.appointment_type_id
    - appointment_type.appointment_type_name
    - class_type.class_type_id
    - class_type.class_type_name
    - observation_service.observation_service_id
    - observation_service.service_name
    - appointment_booklet_type.count
    - appointment_type.count
    - available_product.count
    - charge.count
    - class_type.count
    - dashboard_action.count
    - discount_product.count
    - emr2_procedure.count
    - emr2_procedure_type.count
    - form_question_version_to_product.count
    - invoice_item.count
    - product_set_member.count
    - product_stock.count
    - stock_level.count
    - stock_order_line.count
    - stock_transfer.count
    - treatment_cycle_referral.count

