{{
   config(
    materialized='table',
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
GROUP BY DATE_TRUNC('MONTH',DDATE),SALESPERSON,CARMAKE
