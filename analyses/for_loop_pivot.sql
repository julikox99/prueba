{%set target_makes=['Toyota','Ford','Honda','Nissan','Chevrolet']%}


SELECT DDATE,
    SALESPERSON,
    {% for make in target_makes %}
    sum(case when CARMAKE='{{make}}' then TOTAL_SALE ELSE 0 END) AS SALES_{{make | lower}}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ref("psg_monthly_sales_make")}}
GROUP BY DDATE, SALESPERSON