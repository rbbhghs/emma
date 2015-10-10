- view: form_question_version
  fields:

  - dimension: form_question_version_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_question_version_id

  - dimension: alternate_layout
    type: yesno
    sql: ${TABLE}.alternate_layout

  - dimension: data_type
    type: int
    sql: ${TABLE}.data_type

  - dimension: default_response
    sql: ${TABLE}.default_response

  - dimension: dicom_push_trigger
    type: int
    sql: ${TABLE}.dicom_push_trigger

  - dimension: dicom_series_description
    sql: ${TABLE}.dicom_series_description

  - dimension: dicom_series_instance_uid
    sql: ${TABLE}.dicom_series_instance_uid

  - dimension: emr2_derived_question_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr2_derived_question_id

  - dimension: enum_include_other
    type: yesno
    sql: ${TABLE}.enum_include_other

  - dimension: enum_multi_select
    type: yesno
    sql: ${TABLE}.enum_multi_select

  - dimension: enum_options
    sql: ${TABLE}.enum_options

  - dimension: expression
    sql: ${TABLE}.expression

  - dimension: form_question_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_question_id

  - dimension: graph
    type: yesno
    sql: ${TABLE}.graph

  - dimension: graph_invert_y
    type: yesno
    sql: ${TABLE}.graph_invert_y

  - dimension: graph_max_y
    type: int
    sql: ${TABLE}.graph_max_y

  - dimension: graph_min_y
    type: int
    sql: ${TABLE}.graph_min_y

  - dimension: include_notes
    type: yesno
    sql: ${TABLE}.include_notes

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes_mandatory_if_yes
    type: yesno
    sql: ${TABLE}.notes_mandatory_if_yes

  - dimension: order_interface_name
    sql: ${TABLE}.order_interface_name

  - dimension: paper_file_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.paper_file_type_id

  - dimension: question_name
    sql: ${TABLE}.question_name

  - dimension: question_text
    sql: ${TABLE}.question_text

  - dimension: read_code
    sql: ${TABLE}.read_code

  - dimension: read_code_chapter
    sql: ${TABLE}.read_code_chapter

  - dimension: report_question_name
    sql: ${TABLE}.report_question_name

  - dimension: response_name
    sql: ${TABLE}.response_name

  - dimension: response_scope
    sql: ${TABLE}.response_scope

  - dimension: response_valid_days
    type: int
    sql: ${TABLE}.response_valid_days

  - dimension: row_count
    type: int
    sql: ${TABLE}.row_count

  - dimension: section_controller_action_response
    type: yesno
    sql: ${TABLE}.section_controller_action_response

  - dimension: shareon_dicominterface
    type: yesno
    sql: ${TABLE}.shareon_dicominterface

  - dimension: shareon_hl7interface
    type: yesno
    sql: ${TABLE}.shareon_hl7interface

  - dimension: slider_max
    type: int
    sql: ${TABLE}.slider_max

  - dimension: slider_min
    type: int
    sql: ${TABLE}.slider_min

  - dimension: slider_steps
    type: int
    sql: ${TABLE}.slider_steps

  - dimension: snomed_concept_id
    type: int
    sql: ${TABLE}.snomed_concept_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: sub_data_type
    type: int
    sql: ${TABLE}.sub_data_type

  - dimension: sub_enum_options
    sql: ${TABLE}.sub_enum_options

  - dimension: sub_response_2_name
    sql: ${TABLE}.sub_response_2_name

  - dimension: sub_response_2_unit_text
    sql: ${TABLE}.sub_response_2_unit_text

  - dimension: sub_response_3_name
    sql: ${TABLE}.sub_response_3_name

  - dimension: sub_response_3_unit_text
    sql: ${TABLE}.sub_response_3_unit_text

  - dimension: sub_response_name
    sql: ${TABLE}.sub_response_name

  - dimension: sub_response_unit_text
    sql: ${TABLE}.sub_response_unit_text

  - dimension: track_outcomes
    type: yesno
    sql: ${TABLE}.track_outcomes

  - dimension: unit_text
    sql: ${TABLE}.unit_text

  - dimension: version_number
    type: int
    sql: ${TABLE}.version_number

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_question_version_id
    - question_name
    - response_name
    - sub_response_name
    - sub_response_2_name
    - sub_response_3_name
    - order_interface_name
    - report_question_name
    - form_question.form_question_id
    - paper_file_type.paper_file_type_id
    - paper_file_type.paper_file_type_name
    - emr2_derived_question.emr2_derived_question_id
    - c_plan_form_rule_criterea.count
    - emr2_derived_question_input.count
    - emr2_note_entry.count
    - emr2_report_static_content_section.count
    - emr2_request_form_response.count
    - form_question_instance.count
    - form_question_version_enum_option.count
    - form_question_version_latest.count
    - form_question_version_locale.count
    - form_question_version_to_product.count
    - form_response.count
    - form_response_file.count
    - form_response_latest.count

