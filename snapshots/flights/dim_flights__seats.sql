{% snapshot dim_flights__seats %}

{{
   config(
       target_schema='snapshot',
       unique_key=['aircraft_code', 'seat_no'],

       strategy='check',
       check_cols = ['fare_conditions']
   )
}}

select 
    aircraft_code,
    seat_no,
    fare_conditions
from 
    {{ source('demo_src', 'seats') }} 

{% endsnapshot %}