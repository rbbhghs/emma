- view: derived_treatment_cycles
  derived_table:
    sql: |
      select patient_id,to_treatment_cycle_id,count(*) unique_treatment_cycle_count,min(created_date) referral_created_date,min(referred) referral_referred_date
      from treatment_cycle_referral where to_treatment_cycle_id is not null group by patient_id,to_treatment_cycle_id 

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: patient_id
    type: int
    sql: ${TABLE}.patient_id

  - dimension: to_treatment_cycle_id
    type: int
    sql: ${TABLE}.to_treatment_cycle_id

  - dimension: unique_treatment_cycle_count
    type: int
    sql: ${TABLE}.unique_treatment_cycle_count

  - dimension_group: referral_created_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.referral_created_date

  - dimension_group: referral_referred_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.referral_referred_date

  sets:
    detail:
      - patient_id
      - to_treatment_cycle_id
      - unique_treatment_cycle_count
      - referral_created_date_time
      - referral_referred_date_time


