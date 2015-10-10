- view: patient
  derived_table:
    sql: 
     select 
        individual.individual_id,
        title,
        forename,
        surname,
        concat(title, ' ' ,forename, ' ',surname) as patient_full_name,
        dob,
        sex,
        email,
        address_1,
        address_2,
        address_3,
        address_4,
        address_5,
        postcode,
        town,
        country,
        status as patient_status
        from
        individual
        inner join patient on individual.individual_id=patient.individual_id
        left join address on address.individual_id=individual.individual_id and address_type_id='1'
    #persist_for: 24 hours    

  fields:

     - dimension: individual_id
       type: int
       primary_key: true
       sql: ${TABLE}.individual_id
       
     - dimension: title
       sql: ${TABLE}.title
      
     - dimension: forename
       sql: ${TABLE}.forename

     - dimension: surname
       sql: ${TABLE}.surname
       
     - dimension: patient_full_name
       sql: ${TABLE}.patient_full_name
       
     - dimension: sex
       sql: ${TABLE}.sex 
       
     - dimension: email
       sql: ${TABLE}.email
       
     - dimension: dob
       type: time
       timeframes: [date, week, month, year]
       sql: ${TABLE}.dob
       
     - dimension: address_1
       sql: ${TABLE}.address_1  
       
     - dimension: address_2
       sql: ${TABLE}.address_2    
       
     - dimension: address_3
       sql: ${TABLE}.address_3   
       
     - dimension: address_4
       sql: ${TABLE}.address_4 
       
     - dimension: postcode
       sql: ${TABLE}.postcode 
       
     - dimension: town
       sql: ${TABLE}.country 
       
     - dimension: patient_status
       sql: ${TABLE}.patient_status    
      