- view: patient_letter_template
  fields:

  - dimension: batch_print
    type: yesno
    sql: ${TABLE}.batch_print

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: letter_template_id
    type: int
    sql: ${TABLE}.letter_template_id

  - dimension: letter_template_name
    sql: ${TABLE}.letter_template_name

  - dimension: letter_text
    sql: ${TABLE}.letter_text

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: rtf_template_file
    sql: ${TABLE}.rtf_template_file

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [letter_template_name, patient_letter_revision.count]

