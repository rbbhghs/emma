- view: practitioner
  fields:

  - dimension: abbreviation
    sql: ${TABLE}.abbreviation

  - dimension: anoto_pen_id
    sql: ${TABLE}.anoto_pen_id

  - dimension: bupa_no
    sql: ${TABLE}.bupa_no

  - dimension: csp_no
    sql: ${TABLE}.csp_no

  - dimension: employment_status_id
    type: int
    # hidden: true
    sql: ${TABLE}.employment_status_id

  - dimension: enable_emr
    type: yesno
    sql: ${TABLE}.enable_emr

  - dimension: externally_bookable
    type: yesno
    sql: ${TABLE}.externally_bookable

  - dimension: gmc_no
    sql: ${TABLE}.gmc_no

  - dimension: hpc_no
    sql: ${TABLE}.hpc_no

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: issues_own_invoices
    type: yesno
    sql: ${TABLE}.issues_own_invoices

  - dimension: issuing_company_id
    type: int
    # hidden: true
    sql: ${TABLE}.issuing_company_id

  - dimension: lab_code
    sql: ${TABLE}.lab_code

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: patient_sex
    sql: ${TABLE}.patient_sex

  - dimension: ppp_no
    sql: ${TABLE}.ppp_no

  - dimension: prescription_password
    sql: ${TABLE}.prescription_password

  - dimension: public_diaries
    type: yesno
    sql: ${TABLE}.public_diaries

  - dimension: qualifications
    sql: ${TABLE}.qualifications

  - dimension: rss
    sql: ${TABLE}.rss

  - dimension: rss_password
    sql: ${TABLE}.rss_password

  - dimension_group: safescript_terms_and_conditions_acceptance
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.safescript_terms_and_conditions_acceptance_date

  - dimension: sds_user_id
    sql: ${TABLE}.sds_user_id

  - dimension: signoff
    sql: ${TABLE}.signoff

  - dimension: swift_id
    sql: ${TABLE}.swift_id

  - dimension: treatment_age_max
    type: int
    sql: ${TABLE}.treatment_age_max

  - dimension: treatment_age_min
    type: int
    sql: ${TABLE}.treatment_age_min

  - dimension: view_all_patients
    type: yesno
    sql: ${TABLE}.view_all_patients

  - dimension: view_all_practitioner_notes
    type: yesno
    sql: ${TABLE}.view_all_practitioner_notes

  - dimension: view_public_diaries
    type: yesno
    sql: ${TABLE}.view_public_diaries

  - dimension: workflow_rule_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_rule_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - workflow_rule.rule_name
    - workflow_rule.workflow_rule_id
    - employment_status.employment_status_name
    - employment_status.employment_status_id
    - individual.surname
    - individual.middlename
    - individual.forename
    - individual.individual_id
    - issuing_company.issuing_company_id
    - issuing_company.issuing_company_name
    - appointment_search_result.count
    - c_plan_study_practitioner.count
    - dental_print_journal.count
    - emr2_encounter.count
    - emr_history.count
    - healthcode_claim_message.count
    - healthcode_practitioner_reference.count
    - personal_assistant_to_practitioner.count
    - _charges.count
    - _productivity.count

