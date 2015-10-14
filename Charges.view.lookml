- view: charges
  derived_table:
    sql: |
      select 
              date_format(`charge`.`effective`, '%d/%m/%Y') AS `Charge Date`,
              date_format(`appointment`.`start`, '%d/%m/%Y') AS `Appt Date`,
              appointment.appointment_id,
              `location`.`location_name` AS `Clinic`,
              ifnull((select 
                              `company`.`company_name`
                          from
                              (`patient`
                              left join `company` ON ((`patient`.`company_id` = `company`.`individual_id`)))
                          where
                              (`patient`.`individual_id` = `charge`.`patient_id`)),
                      'None recorded') AS `Patient Employer`,
              ifnull(ifnull((select 
                                      `company`.`company_name`
                                  from
                                      `company`
                                  where
                                      (`company`.`individual_id` = `charge`.`charge_to_id`)),
                              (select 
                                      `insurance_company`.`insurance_company_name`
                                  from
                                      `insurance_company`
                                  where
                                      (`insurance_company`.`individual_id` = `charge`.`charge_to_id`))),
                      'Patient') AS `Charged To`,
              `contract`.`contract_name` AS `Contract`,
              concat(`pat`.`forename`, ' ', `pat`.`surname`) AS `Patient`,
              `product`.`product_name` AS `Charge Name`,
              `abt`.`appointment_booklet_type_name` AS `Booklet type`,
              `ab`.`created_date` AS `Booklet created date`,
              `charge`.`quantity` AS `Quantity`,
              (`charge`.`price` * if(`charge`.`credit`, -(1), 1)) AS `Unit Cost`,
              ((`charge`.`quantity` * `charge`.`price`) * if(`charge`.`credit`, -(1), 1)) AS `Charge Total`,
              concat(`doc`.`forename`, ' ', `doc`.`surname`) AS `Practitioner`,
              `invoice`.`total_price` AS `Invoice Total`,
              if(((`invoice`.`external_invoice_number` is not null)
                      and (`invoice`.`external_invoice_number` <> '')),
                  `invoice`.`external_invoice_number`,
                  concat(lpad(`invoice`.`location_id`, 3, '0'),
                          '-',
                          char((65 + (floor((`invoice`.`invoice_id` / 100000)) % 26)),
                                  (65 + floor((floor((`invoice`.`invoice_id` / 100000)) / 26)))),
                          lpad((`invoice`.`invoice_id` % 100000),
                                  5,
                                  '0'))) AS `Invoice No`,
              if((`p`.`payment_id` is not null),
                  'Payment Received',
                  `product`.`product_name`) AS `Description`,
              if((`invoice`.`total_price` < 0),
                  'Credit Note',
                  if((`invoice`.`written_off` is not null),
                      'Write Off',
                      'Invoice')) AS `Invoice Type`,
              ifnull(ifnull(ifnull((select 
                                              `company`.`company_name`
                                          from
                                              `company`
                                          where
                                              (`company`.`individual_id` = `invoice`.`invoicee_id`)),
                                      (select 
                                              `insurance_company`.`insurance_company_name`
                                          from
                                              `insurance_company`
                                          where
                                              (`insurance_company`.`individual_id` = `invoice`.`invoicee_id`))),
                              (select 
                                      concat(`pat`.`forename`, ' ', `pat`.`surname`)
                                  from
                                      `individual` `pat`
                                  where
                                      ((`invoice`.`invoicee_id` = `pat`.`individual_id`)
                                          and (`pat`.`individual_type_id` = '4')))),
                      'Not invoiced') AS `Invoiced To`,
              `p`.`amount` AS `Payment Amount`,
              `p`.`payment_date` AS `Received Date`,
              `pm`.`payment_method_name` AS `Payment Method`
          from
              (((((((((((((`charge`
              left join `product` ON ((`charge`.`product_id` = `product`.`product_id`)))
              left join `individual` `pat` ON ((`charge`.`patient_id` = `pat`.`individual_id`)))
              left join `patient` ON ((`pat`.`individual_id` = `patient`.`individual_id`)))
              left join `invoice` ON ((`charge`.`invoice_id` = `invoice`.`invoice_id`)))
              left join `appointment` ON ((`charge`.`appointment_id` = `appointment`.`appointment_id`)))
              left join `individual` `doc` ON ((`appointment`.`primary_doctor_id` = `doc`.`individual_id`)))
              left join `contract` ON ((`charge`.`contract_id` = `contract`.`contract_id`)))
              left join `payment_allocation` `pa` ON (((`invoice`.`invoice_id` = `pa`.`to_id`)
                  and (`pa`.`status` = 'A'))))
              left join `payment` `p` ON ((`pa`.`from_id` = `p`.`payment_id`)))
              left join `location` ON ((`charge`.`location_id` = `location`.`location_id`)))
              left join `payment_method` `pm` ON ((`p`.`payment_method_id` = `pm`.`payment_method_id`)))
              left join `appointment_booklet` `ab` ON ((`appointment`.`appointment_booklet_id` = `ab`.`appointment_booklet_id`)))
              left join `appointment_booklet_type` `abt` ON ((`ab`.`appointment_booklet_type_id` = `abt`.`appointment_booklet_type_id`)))
          group by `charge`.`charge_id`
          

  fields:
  - measure: number_of_charges
    type: count
    drill_fields: detail*
    
    
  - dimension: appointment_id
    type: int
    sql: ${TABLE}.`appointment_id`
    
  - measure: number_of_appointments
    type: count_distinct
    sql: ${appointment_id}

  - dimension: charge_date
    sql: ${TABLE}.`Charge Date`

  - dimension: appt_date
    sql: ${TABLE}.`Appt Date`

  - dimension: clinic
    sql: ${TABLE}.Clinic

  - dimension: patient_employer
    sql: ${TABLE}.`Patient Employer`

  - dimension: charged_to
    sql: ${TABLE}.`Charged To`

  - dimension: contract
    sql: ${TABLE}.Contract

  - dimension: patient
    sql: ${TABLE}.Patient

  - dimension: charge_name
    sql: ${TABLE}.`Charge Name`

  - dimension: booklet_type
    sql: ${TABLE}.`Booklet type`

  - dimension: booklet_created_date
    sql: ${TABLE}.`Booklet created date`

  - dimension: quantity
    type: number
    sql: ${TABLE}.Quantity

  - dimension: unit_cost
    type: number
    sql: ${TABLE}.`Unit Cost`

  - dimension: charge_total
    type: number
    sql: ${TABLE}.`Charge Total`
    
  - measure: average_charge_value
    type: average
    sql: ${charge_total}
    

  - dimension: practitioner
    sql: ${TABLE}.Practitioner

  - dimension: invoice_total
#     hidden: true
    type: number
    sql: ${TABLE}.`Invoice Total`

  - measure: total_invoice_total
    type: sum
    sql: ${invoice_total}

  - dimension: invoice_no
    sql: ${TABLE}.`Invoice No`

  - dimension: description
    sql: ${TABLE}.Description

  - dimension: invoice_type
    sql: ${TABLE}.`Invoice Type`

  - dimension: invoiced_to
    sql: ${TABLE}.`Invoiced To`

  - dimension: payment_amount
    sql: ${TABLE}.`Payment Amount`

  - dimension: received_date
    sql: ${TABLE}.`Received Date`

  - dimension: payment_method
    sql: ${TABLE}.`Payment Method`

  sets:
    detail:
      - charge_date
      - number_of_appointments
#       - clinic
#       - patient_employer
#       - charged_to
#       - contract
#       - patient
#       - charge_name
#       - booklet_type
#       - booklet_created_date
#       - quantity
#       - unit_cost
#       - charge_total
#       - practitioner
#       - invoice_total
#       - invoice_no
#       - description
#       - invoice_type
#       - invoiced_to
#       - payment_amount
#       - received_date
#       - payment_method

