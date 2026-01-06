{{config(tags=['dash_sales_bi'])}}

SELECT  DDATE,
      ID_SALESPERSON,
      ID_CARMAKE,
       TOTAL_SALE,
       TOTALCOM 
FROM {{ref("psg_monthly_sales_make")}} AS PSG_M 
LEFT JOIN {{ref("dim_carmake")}} AS DIM_CM ON PSG_M.CARMAKE=DIM_CM.CARMAKE
LEFT JOIN {{ref("dim_salesperson")}} AS DIM_SP ON PSG_M.SALESPERSON=DIM_SP.SALESPERSON