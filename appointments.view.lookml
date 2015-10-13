- view: appointments
  derived_table:
    sql: |
      select 
                    `appointment`.`appointment_id` AS `appointment_id`,
                    `appointment`.`treatment_cycle_referral_id` AS `treatment_cycle_referral_id`,
                    `at`.`appointment_type_name` AS `Appointment type`,
                    concat_ws(_latin1' ',
                            `doc`.`title`,
                            `doc`.`forename`,
                            `doc`.`surname`) AS `Practitioner Name`,
                    `appointment`.`patient_id` AS `patient_id`,
                    concat_ws(_latin1' ',
                            `pat`.`title`,
                            `pat`.`forename`,
                            `pat`.`surname`) AS `Patient Name`,
                    `pat`.`email` AS `email`,
                    `appointment`.`location_id` AS `location_id`,
                    `loc`.`location_name` AS `Location treated`,
                    `asec`.`start` AS `Appt start time`,
                    `asec`.`end` AS `Appt end time`,
                    `appointment`.`arrive` AS `Arrive time`,
                    `appointment`.`view` AS `View time`,
                    `appointment`.`leave` AS `Leave time`,
                    `appointment`.`dna` AS `Is DNA`,
                    `appointment`.`late_cancellation` AS `Is Late Cancellation`,
                    cax.description as 'Cancellatation Reason',
                    cad.description as 'DNA Reason',
                    `appointment`.`billed` AS `Time billed`,
                    `appointment`.`status` AS `Appointment status`,
                    `appointment`.`online_booking` AS `Was booked online`,
                    `appointment`.`charge_to_id` AS `Charge to ID`,
                    ifnull(ifnull((select 
                                            `company`.`company_name` AS `company_name`
                                        from
                                            `company`
                                        where
                                            (`company`.`individual_id` = `appointment`.`charge_to_id`)),
                                    (select 
                                            `insurance_company`.`insurance_company_name` AS `insurance_company_name`
                                        from
                                            `insurance_company`
                                        where
                                            (`insurance_company`.`individual_id` = `appointment`.`charge_to_id`))),
                            _latin1'Patient') AS `Charged To`,
                    concat(`b`.`forename`, ' ', `b`.`surname`) AS `Booked by`
                from
                    `appointment_section` `asec`
                    join `appointment` ON `asec`.`appointment_id` = `appointment`.`appointment_id`
                    join `location` `loc` ON `appointment`.`location_id` = `loc`.`location_id`
                    join `individual` `doc` ON `asec`.`doctor_id` = `doc`.`individual_id`
                    left join `cab_cancellation_reason` `cax` ON `appointment`.`cab_cancellation_reason_code` = `cax`.`cab_cancellation_reason_code`
                    left join `cab_dna_reason` `cad` ON `appointment`.`cab_dna_reason_code` = `cad`.`cab_dna_reason_code`
                    join `individual` `pat` ON `appointment`.`patient_id` = `pat`.`individual_id`
                    join `appointment_type` `at` ON `appointment`.`appointment_type_id` = `at`.`appointment_type_id`
                    left join `event` `e` ON `appointment`.`appointment_id` = `e`.`entity_id`
                        and (`e`.`event_type_id` = '7')
                    left join `individual` `b` ON (`e`.`user_id` = `b`.`individual_id`)
                    limit 10

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: appointment_id
    type: number
    sql: ${TABLE}.appointment_id

  - dimension: treatment_cycle_referral_id
    type: number
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: appointment_type
    sql: ${TABLE}.`Appointment type`

  - dimension: practitioner_name
    sql: ${TABLE}.`Practitioner Name`

  - dimension: patient_id
    type: number
    sql: ${TABLE}.patient_id

  - dimension: patient_name
    sql: ${TABLE}.`Patient Name`

  - dimension: email
    sql: ${TABLE}.email

  - dimension: location_id
    type: number
    sql: ${TABLE}.location_id

  - dimension: location_treated
    sql: ${TABLE}.`Location treated`

  - dimension_group: appt_start_time
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Appt start time`

  - dimension_group: appt_end_time
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Appt end time`

  - dimension_group: arrive_time
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Arrive time`

  - dimension_group: view_time
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`View time`

  - dimension_group: leave_time
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Leave time`

  - dimension: is_dna
    sql: ${TABLE}.`Is DNA`

  - dimension: is_late_cancellation
    sql: ${TABLE}.`Is Late Cancellation`

  - dimension: cancellatation_reason
    sql: ${TABLE}.`Cancellatation Reason`

  - dimension: dna_reason
    sql: ${TABLE}.`DNA Reason`

  - dimension: time_billed
    sql: ${TABLE}.`Time billed`

  - dimension: appointment_status
    sql: ${TABLE}.`Appointment status`

  - dimension: was_booked_online
    sql: ${TABLE}.`Was booked online`

  - dimension: charge_to_id
    type: number
    sql: ${TABLE}.`Charge to ID`

  - dimension: charged_to
    sql: ${TABLE}.`Charged To`

  - dimension: booked_by
    sql: ${TABLE}.`Booked by`

  sets:
    detail:
      - appointment_id
      - treatment_cycle_referral_id
      - appointment_type
      - practitioner_name
      - patient_id
      - patient_name
      - email
      - location_id
      - location_treated
      - appt_start_time
      - appt_end_time
      - arrive_time
      - view_time
      - leave_time
      - is_dna
      - is_late_cancellation
      - cancellatation_reason
      - dna_reason
      - time_billed
      - appointment_status
      - was_booked_online
      - charge_to_id
      - charged_to
      - booked_by

