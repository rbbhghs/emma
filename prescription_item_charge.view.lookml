- view: prescription_item_charge
  fields:

  - dimension: prescription_item_charge_id
    primary_key: true
    type: int
    sql: ${TABLE}.prescription_item_charge_id

  - dimension: charge_id
    type: int
    # hidden: true
    sql: ${TABLE}.charge_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: prescription_item_id
    type: int
    # hidden: true
    sql: ${TABLE}.prescription_item_id

  - measure: count
    type: count
    drill_fields: [prescription_item_charge_id, charge.cloned_from_charge_id, prescription_item.prescription_item_id]

