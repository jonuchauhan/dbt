{% snapshot scd_raw_listings %}

{{
   config(
       target_schema='DEV',
       unique_key='ID',
       strategy='check',
       check_cols= 'all',
       invalidate_hard_deletes=True
   )
}}

select * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}