- view: payor
  derived_table:
    sql: 
        select 
        individual.individual_id,
        coalesce(company.company_name,
            insurance_company.insurance_company_name,
            concat(individual.title,
                    ' ',
                    individual.forename,
                    ' ',
                    individual.surname)) as payor,individual_type_name,
            coalesce(company.company_name,insurance_company.insurance_company_name,'Patient/Self-Pay') payor_type
        from
        individual
        left join
        insurance_company ON individual.individual_id = insurance_company.individual_id
        left join
        company ON individual.individual_id = company.individual_id 
        left join individual_type ON individual_type.individual_type_id = individual.individual_type_id 
    sql_trigger_value: SELECT CURDATE()
    indexes: [individual_id]  

  fields:

     - dimension: individual_id
       type: int
       sql: ${TABLE}.individual_id
       
     - dimension: payor
       sql: ${TABLE}.payor
#
#     - measure: total_profit
#       type: sum
#       sql: ${profit}
