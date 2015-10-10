- view: patient_letter_revision
  fields:

  - dimension: patient_letter_revision_id
    primary_key: true
    type: int
    sql: ${TABLE}.patient_letter_revision_id

  - dimension: author_id
    type: int
    sql: ${TABLE}.author_id

  - dimension: batch_print_job_id
    type: int
    # hidden: true
    sql: ${TABLE}.batch_print_job_id

  - dimension: body
    sql: ${TABLE}.body

  - dimension: clinical_summary_type
    type: int
    sql: ${TABLE}.clinical_summary_type

  - dimension: copy_to_address_id
    type: int
    sql: ${TABLE}.copy_to_address_id

  - dimension: copy_to_id
    type: int
    sql: ${TABLE}.copy_to_id

  - dimension_group: date_printed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_printed

  - dimension: doctor_id
    type: int
    sql: ${TABLE}.doctor_id

  - dimension: document_name
    sql: ${TABLE}.document_name

  - dimension: external_document
    type: yesno
    sql: ${TABLE}.external_document

  - dimension: file_name
    sql: ${TABLE}.file_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: letter_id
    type: int
    sql: ${TABLE}.letter_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_letter_template_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_letter_template_id

  - dimension: recipient_address_id
    type: int
    sql: ${TABLE}.recipient_address_id

  - dimension: recipient_id
    type: int
    sql: ${TABLE}.recipient_id

  - dimension_group: revision
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.revision_date

  - dimension: revision_number
    type: int
    sql: ${TABLE}.revision_number

  - dimension_group: sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent

  - dimension: sent_by_id
    type: int
    sql: ${TABLE}.sent_by_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: subject
    sql: ${TABLE}.subject

  - dimension: treatment_cycle_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - patient_letter_revision_id
    - file_name
    - document_name
    - patient_letter_template.letter_template_name
    - treatment_cycle.treatment_cycle_id
    - treatment_cycle.treatment_cycle_name
    - batch_print_job.file_name

