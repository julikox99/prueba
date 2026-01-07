{{
   config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=['DDATE','SALESPERSON','CARMAKE'],
    tags=['procesing','sales','carmake']
   )
}}

SELECT 
      DATE_TRUNC('MONTH',DDATE) AS DDATE,
      SALESPERSON,
      CARMAKE,
      SUM(SALEPRICE - COM_EAR) AS TOTAL_SALE,
      SUM(COM_EAR) AS TOTALCOM
FROM {{ref("stg_sales_data_202p") }}
{% if is_incremental() %}
where DDATE > (SELECT MAX(DDATE) FROM {{this}})
{% endif %}
GROUP BY DATE_TRUNC('MONTH',DDATE),SALESPERSON,CARMAKE
