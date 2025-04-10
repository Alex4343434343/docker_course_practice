{{
  config(
    materialized = 'table'
    )
}}
select 
    book_ref, 
    book_date, 
    total_amount,
    {{- bookref_to_bigint('book_ref') }} as bookref_to_bigint
from 
    {{ source('demo_src', 'bookings') }}