{% snapshot salesperson_snapshot %}
{{
    config(
        target_schema='snapshot',
        unique_key='salesperosn_id',
        strategy='timestamp',
        updated_at='last_updated_ts',
        invalidate_hard_deletes=True
    )
}}

SELECT SALESPEROSN_ID, 
       SALESPERSON_NAME,
	   COMMISSION_RATE,
	   STORE_ID,
	   STATUS,
	   LAST_UPDATED_TS
FROM {{source("raw_bi_car","SALESPERSON") }}

{% endsnapshot %}