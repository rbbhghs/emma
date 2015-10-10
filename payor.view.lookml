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
                    individual.surname)) as payor
        from
        individual
        left join
        insurance_company ON individual.individual_id = insurance_company.individual_id
        left join
        company ON individual.individual_id = company.individual_id
    #persist_for: 24 hours    
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
