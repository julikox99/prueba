SELECT *
FROM {{ref("stg_sales_data_202p")}}
{% if target.name!='prod_booster'%}
LIMIT 10
{%endif%}