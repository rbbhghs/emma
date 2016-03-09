- view: prescription_item
  fields:

  - dimension: prescription_item_id
    primary_key: true
    type: int
    sql: ${TABLE}.prescription_item_id

  - dimension: batch_code
    sql: ${TABLE}.batch_code

  - dimension: batch_details
    type: yesno
    sql: ${TABLE}.batch_details

  - dimension_group: batch_expiry
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.batch_expiry

  - dimension: batch_number
    sql: ${TABLE}.batch_number

  - dimension: continuous
    type: yesno
    sql: ${TABLE}.continuous

  - dimension: controlled_drug_schedule_id
    type: int
    sql: ${TABLE}.controlled_drug_schedule_id

  - dimension: dispense_locally
    type: yesno
    sql: ${TABLE}.dispense_locally

  - dimension: dispense_notes
    sql: ${TABLE}.dispense_notes

  - dimension_group: dispensed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dispensed

  - dimension: dispensed_by_id
    type: int
    sql: ${TABLE}.dispensed_by_id

  - dimension: dosage_text
    sql: ${TABLE}.dosage_text

  - dimension: dose_frequency_token
    sql: ${TABLE}.dose_frequency_token

  - dimension: dose_quantity_token
    sql: ${TABLE}.dose_quantity_token

  - dimension: drug_id
    type: int
    sql: ${TABLE}.drug_id

  - dimension: drug_text
    sql: ${TABLE}.drug_text

  - dimension: issue_count
    type: int
    sql: ${TABLE}.issue_count

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: medically_necessary
    type: yesno
    sql: ${TABLE}.medically_necessary

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: prescription_id
    type: int
    # hidden: true
    sql: ${TABLE}.prescription_id

  - dimension: repeat_of_id
    type: int
    sql: ${TABLE}.repeat_of_id

  - dimension_group: review
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.review_date

  - dimension: samples_given
    type: yesno
    sql: ${TABLE}.samples_given

  - dimension: status
    sql: ${TABLE}.status

  - dimension: supply
    type: number
    sql: ${TABLE}.supply

  - dimension: supply_days
    type: int
    sql: ${TABLE}.supply_days

  - dimension: supply_text
    sql: ${TABLE}.supply_text

  - dimension: supply_units_id
    type: int
    sql: ${TABLE}.supply_units_id

  - measure: count
    type: count
    drill_fields: [prescription_item_id, prescription.prescription_id, emr2_note_entry.count, prescription_item_charge.count]

