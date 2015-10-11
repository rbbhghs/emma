- view: appointments
  derived_table:
    sql: |
       select 
              `appointment`.`appointment_id` AS `appointment_id`,
              `appointment`.`treatment_cycle_referral_id` AS `treatment_cycle_referral_id`,
              `at`.`appointment_type_name` AS `appointment_type_name`,
              concat_ws(_latin1' ',
                      `doc`.`title`,
                      `doc`.`forename`,
                      `doc`.`surname`) AS `practitioner`,
              `appointment`.`patient_id` AS `patient_id`,
              concat_ws(_latin1' ',
                      `pat`.`title`,
                      `pat`.`forename`,
                      `pat`.`surname`) AS `Patient Name`,
              `pat`.`email` AS `email`,
              `appointment`.`location_id` AS `location_id`,
              `loc`.`location_name` AS `location_name`,
              `asec`.`start` AS `start`,
              `asec`.`end` AS `end`,
              `appointment`.`arrive` AS `arrive`,
              `appointment`.`view` AS `view`,
              `appointment`.`leave` AS `leave`,
              `appointment`.`dna` AS `dna`,
              `appointment`.`late_cancellation` AS `late_cancellation`,
              `appointment`.`billed` AS `billed`,
              `appointment`.`status` AS `status`,
              `appointment`.`online_booking` AS `online_booking`,
              `appointment`.`charge_to_id` AS `charge_to_id`,
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
              (((((((`appointment_section` `asec`
              join `appointment` ON ((`asec`.`appointment_id` = `appointment`.`appointment_id`)))
              join `location` `loc` ON ((`appointment`.`location_id` = `loc`.`location_id`)))
              join `individual` `doc` ON ((`asec`.`doctor_id` = `doc`.`individual_id`)))
              join `individual` `pat` ON ((`appointment`.`patient_id` = `pat`.`individual_id`)))
              join `appointment_type` `at` ON ((`appointment`.`appointment_type_id` = `at`.`appointment_type_id`)))
              left join `event` `e` ON (((`appointment`.`appointment_id` = `e`.`entity_id`)
                  and (`e`.`event_type_id` = '7'))))
              left join `individual` `b` ON ((`e`.`user_id` = `b`.`individual_id`)))
              

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: appointment_id
    type: number
    sql: ${TABLE}.appointment_id

  - dimension: treatment_cycle_referral_id
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: appointment_type_name
    sql: ${TABLE}.appointment_type_name

  - dimension: Practitioner
    sql: ${TABLE}.practitioner

  - dimension: patient_id
    type: number
    sql: ${TABLE}.patient_id

  - dimension: Patient_name
    sql: ${TABLE}.`Patient Name`

  - dimension: email
    sql: ${TABLE}.email

  - dimension: location_id
    type: number
    sql: ${TABLE}.location_id

  - dimension: Location_name
    sql: ${TABLE}.location_name

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end

  - dimension_group: arrive
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.arrive

  - dimension_group: view
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.view

  - dimension_group: leave
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`leave`

  - dimension: dna
    sql: ${TABLE}.dna

  - dimension: late_cancellation
    sql: ${TABLE}.late_cancellation

  - dimension: billed
    sql: ${TABLE}.billed

  - dimension: status
    sql: ${TABLE}.status

  - dimension: online_booking
    sql: ${TABLE}.online_booking

  - dimension: charge_to_id
    type: number
    sql: ${TABLE}.charge_to_id

  - dimension: charged_to
    sql: ${TABLE}.`Charged To`

  - dimension: booked_by
    sql: ${TABLE}.`Booked by`

  sets:
    detail:
      - appointment_id
      - treatment_cycle_id
      - appointment_type_name
      - practitioner
      - patient_id
      - patient_name
      - email
      - location_id
      - location_name
      - start
      - end
      - arrive
      - view
      - leave
      - dna
      - late_cancellation
      - billed
      - status
      - online_booking
      - charge_to_id
      - charged_to
      - booked_by

