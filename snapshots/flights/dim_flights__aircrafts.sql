{% snapshot dim_flights__aircrafts %}

{{
   config(
       target_schema='snapshot',
       unique_key='aircraft_code',

       strategy='check',
       check_cols = ['aircraft_code', 'model', 'range'],
       hard_deletes='invalidate'
      
   )
}}

select 
    aircraft_code,
    model, 
    "range"
from 
    {{ source('demo_src', 'aircrafts') }} 

{% endsnapshot %}