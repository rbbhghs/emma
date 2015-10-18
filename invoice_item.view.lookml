- view: invoice_item
  fields:

  - dimension: previous_invoice_item_id
    primary_key: true
    type: int
    sql: ${TABLE}.previous_invoice_item_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: charge_id
    type: int
    # hidden: true
    sql: ${TABLE}.charge_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: currency
    sql: ${TABLE}.currency

  - dimension: doctor_id
    type: int
    sql: ${TABLE}.doctor_id

  - dimension: invoice_id
    type: int
    # hidden: true
    sql: ${TABLE}.invoice_id

  - dimension: invoice_item_id
    type: int
    # hidden: true
    sql: ${TABLE}.invoice_item_id

  - dimension: item_price_net
    type: number
    sql: ${TABLE}.item_price_net

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: line_price
    type: number
    sql: ${TABLE}.line_price

  - dimension: line_price_net
    type: number
    sql: ${TABLE}.line_price_net

  - dimension: line_price_vat
    type: number
    sql: ${TABLE}.line_price_vat

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: product_id
    type: int
    # hidden: true
    sql: ${TABLE}.product_id

  - dimension: quantity
    type: int
    sql: ${TABLE}.quantity

  - dimension: vat_rate_code
    sql: ${TABLE}.vat_rate_code

  - dimension: vat_rate_percentage
    type: number
    sql: ${TABLE}.vat_rate_percentage

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - previous_invoice_item_id
    - invoice_item.previous_invoice_item_id
    - invoice.raised_by_invoice_id
    - product.product_id
    - product.product_name
    - location.location_name
    - location.billing_location_id
    - appointment.appointment_id
    - charge.cloned_from_charge_id
    - invoice_item.count
    - payment_credit_item_allocation.count
    - payment_line_item_allocation.count

