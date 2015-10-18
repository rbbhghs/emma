- view: treatment_cycle_referral_procedure
  fields:

  - dimension: treatment_cycle_referral_procedure_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_referral_procedure_id

  - dimension: dicom_procedure_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_procedure_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: pacs_order_id
    type: int
    # hidden: true
    sql: ${TABLE}.pacs_order_id

  - dimension: reporting_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.reporting_group_id

  - dimension: reviewer_id
    type: int
    sql: ${TABLE}.reviewer_id

  - dimension: secondary_reporting_group_id
    type: int
    sql: ${TABLE}.secondary_reporting_group_id

  - dimension: secondary_reviewer_id
    type: int
    sql: ${TABLE}.secondary_reviewer_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - treatment_cycle_referral_procedure_id
    - treatment_cycle_referral.treatment_cycle_referral_id
    - dicom_procedure.dicom_procedure_id
    - pacs_order.id
    - reporting_group.reporting_group_id
    - reporting_group.reporting_group_name

