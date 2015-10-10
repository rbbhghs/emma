- view: went_to_bank
  fields:

  - dimension: went_to_bank_id
    primary_key: true
    type: int
    sql: ${TABLE}.went_to_bank_id

  - dimension_group: banked
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.banked

  - dimension: cash_amount_banked
    type: number
    sql: ${TABLE}.cash_amount_banked

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: issuing_company_id
    type: int
    # hidden: true
    sql: ${TABLE}.issuing_company_id

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

  - dimension: payingin_slip_number
    sql: ${TABLE}.payingin_slip_number

  - dimension: petty_cash
    type: number
    sql: ${TABLE}.petty_cash

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - went_to_bank_id
    - location.location_name
    - location.billing_location_id
    - issuing_company.issuing_company_id
    - issuing_company.issuing_company_name
    - payment.count

