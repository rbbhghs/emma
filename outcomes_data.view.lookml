- view: outcomes_data
  derived_table:
    sql: |
      select 
       `tc`.`patient_id` AS `Patient ID`,
          `tc`.`treatment_cycle_id` AS `Treatment cycle ID`,
          `tc`.`opened` AS `Initial referral date`,
          concat(`i`.`forename`, ' ', `i`.`surname`) AS `Treatment owner`,
          concat(`p`.`forename`, ' ', `p`.`surname`) AS `Patient name`,
          `sdt`.`diagnosis_type_name` AS `Diagnosis`,
          `a`.`goal_id` AS `Goal ID`,
          `a`.`appointment_id` AS `Appointment ID`,
          `appointment`.`start` AS `Appointment Date`,
          `at`.`appointment_type_name` AS `Appointment type name`,
          concat(`tt`.`forename`, ' ', `tt`.`surname`) AS `Treatment provider`,
          `g`.`marker_type` AS `Marker type`,
          `g`.`goal_description` AS `Goal description`,
          `g`.`create_date` AS `Date of goal creation`,
          `g`.`target_date` AS `Goal target date`,
          `g`.`target_score` AS `Goal target score`,
          `g`.`target_vas_score` AS `Target VAS score`,
          `a`.`goal_score_id` AS `Goal Score ID`,
          `a`.`create_date` AS `Score recorded date`,
          `a`.`treatment_point` AS `Treatment point`,
          `a`.`score` AS `Score`,
          `a`.`vas_score` AS `VAS Score`,
          `bpp`.`name` AS `Exercise body part`,
          `e`.`exercise_name` AS `Exercise name`,
          `pe`.`frequency_times` AS `Exercise frequency`,
          `pe`.`programme_order` AS `Exercise Order`,
          (select 
                  `c`.`score`
              from
                  `goal_score` `c`
              where
                  (`c`.`goal_id` = `a`.`goal_id`)
              order by `c`.`create_date`
              limit 1) AS `Initial Score`,
          (10 * (`a`.`score` - (select 
                  `c`.`score`
              from
                  `goal_score` `c`
              where
                  (`c`.`goal_id` = `a`.`goal_id`)
              order by `c`.`create_date`
              limit 1))) AS `Cumulative effect (%)`,
          truncate(((100 * (`a`.`score` - (select 
                      `c`.`score`
                  from
                      `goal_score` `c`
                  where
                      (`c`.`goal_id` = `a`.`goal_id`)
                  order by `c`.`create_date`
                  limit 1))) / `a`.`score`),
              1) AS `Relative effect (%)`,
          (select 
                  `c`.`score`
              from
                  `goal_score` `c`
              where
                  (`c`.`goal_id` = `a`.`goal_id`)
              order by `c`.`create_date` desc
              limit 1) AS `Latest score`,
          (to_days(`a`.`create_date`) - to_days(`g`.`create_date`)) AS `Days since goal creation` from
          `appointment`
              left join
          `treatment_cycle` `tc` ON `appointment`.`treatment_cycle_id` = `tc`.`treatment_cycle_id`
              left join
          `goal_score` `a` ON `a`.`appointment_id` = `appointment`.`appointment_id`
              left join
          `goal` `g` ON `a`.`goal_id` = `g`.`goal_id`
              left join
          `appointment_type` `at` ON `appointment`.`appointment_type_id` = `at`.`appointment_type_id`
              left join
          `individual` `d` ON `appointment`.`primary_doctor_id` = `d`.`individual_id`
              left join
          `simple_diagnosis_type` `sdt` ON `tc`.`diagnosis_type_id` = `sdt`.`diagnosis_type_id`
              left join
          `individual` `i` ON `tc`.`owner_id` = `i`.`individual_id`
              left join
          `individual` `p` ON `tc`.`patient_id` = `p`.`individual_id`
              left join
          `patient_exercise_programme` `ep` ON `appointment`.`appointment_id` = `ep`.`appointment_id`
              left join
          `body_part` `bpp` ON `ep`.`body_part_id` = `bpp`.`body_part_id`
              left join
          `patient_exercise` `pe` ON `pe`.`programme_id` = `ep`.`programme_id`
              left join
          `exercise` `e` ON `pe`.`exercise_id` = `e`.`exercise_id`
              left join
          `individual` `tt` ON `appointment`.`primary_doctor_id` = `tt`.`individual_id`
      where `appointment`.status='A' and `appointment`.`leave` is not null;
      sql_trigger_value: SELECT CURDATE()
      indexes: [individual_id, treatment_cycle_id, appointment_id, goal_id]   

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: patient_id
    sql: ${TABLE}.`Patient ID`

  - dimension: treatment_cycle_id
    sql: ${TABLE}.`Treatment cycle ID`

  - dimension: initial_referral_date
    sql: ${TABLE}.`Initial referral date`

  - dimension: treatment_owner
    sql: ${TABLE}.`Treatment owner`

  - dimension: patient_name
    sql: ${TABLE}.`Patient name`

  - dimension: diagnosis
    sql: ${TABLE}.Diagnosis

  - dimension: goal_id
    sql: ${TABLE}.`Goal ID`

  - dimension: appointment_id
    sql: ${TABLE}.`Appointment ID`

  - dimension_group: appointment_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`Appointment Date`

  - dimension: appointment_type_name
    sql: ${TABLE}.`Appointment type name`

  - dimension: treatment_provider
    sql: ${TABLE}.`Treatment provider`

  - dimension: marker_type
    sql: ${TABLE}.`Marker type`

  - dimension: goal_description
    sql: ${TABLE}.`Goal description`

  - dimension: date_of_goal_creation
    sql: ${TABLE}.`Date of goal creation`

  - dimension: goal_target_date
    sql: ${TABLE}.`Goal target date`

  - dimension: goal_target_score
    sql: ${TABLE}.`Goal target score`

  - dimension: target_vas_score
    sql: ${TABLE}.`Target VAS score`

  - dimension: goal_score_id
    sql: ${TABLE}.`Goal Score ID`

  - dimension: score_recorded_date
    sql: ${TABLE}.`Score recorded date`

  - dimension: treatment_point
    sql: ${TABLE}.`Treatment point`

  - dimension: score
    sql: ${TABLE}.Score

  - dimension: vas_score
    sql: ${TABLE}.`VAS Score`

  - dimension: exercise_body_part
    sql: ${TABLE}.`Exercise body part`

  - dimension: exercise_name
    sql: ${TABLE}.`Exercise name`

  - dimension: exercise_frequency
    sql: ${TABLE}.`Exercise frequency`

  - dimension: exercise_order
    sql: ${TABLE}.`Exercise Order`

  - dimension: initial_score
    sql: ${TABLE}.`Initial Score`

  - dimension: cumulative_effect_
    sql: ${TABLE}.`Cumulative effect (%)`

  - dimension: relative_effect_
    sql: ${TABLE}.`Relative effect (%)`

  - dimension: latest_score
    sql: ${TABLE}.`Latest score`

  - dimension: days_since_goal_creation
    sql: ${TABLE}.`Days since goal creation`
    
  - measure: count_sessions
    label: '# of Sessions'
    type: count_distinct
    sql: ${session_number}  
    sql_distinct_key: ${session_number}
    
  - measure: count_patients
    label: '# of Patients'
    type: count_distinct
    sql: ${patient_id}  
    sql_distinct_key: ${patient_id} 
    
  - measure: count_treatments
    label: '# of Treatments'
    type: count_distinct
    sql: ${treatment_cycle_id}  
    sql_distinct_key: ${treatment_cycle_id}   
    
  - measure: avg_sessions
    label: 'Avg # of Sessions'
    type: avg
    sql: ${session_number}  
    sql_distinct_key: ${session_number}
    value_format: '0.000'  

  - measure: avg_score
    label: 'Avg Score'
    type: avg
    sql: ${score}  
    value_format: '0.000'  
    
  - measure: avg_latest_score
    label: 'Avg Latest Score'
    type: avg
    sql: ${latest_score}  
    value_format: '0.000'    

  sets:
    detail:
      - patient_id
      - treatment_cycle_id
      - initial_referral_date
      - treatment_owner
      - patient_name
      - diagnosis
      - goal_id
      - appointment_id
      - appointment_date
      - appointment_type_name
      - treatment_provider
      - marker_type
      - goal_description
      - date_of_goal_creation
      - goal_target_date
      - goal_target_score
      - target_vas_score
      - goal_score_id
      - score_recorded_date
      - treatment_point
      - score
      - vas_score
      - exercise_body_part
      - exercise_name
      - exercise_frequency
      - exercise_order
      - initial_score
      - cumulative_effect_
      - relative_effect_
      - latest_score
      - days_since_goal_creation

