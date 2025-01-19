{{
  config(
    materialized = 'table'
    )
}}
select
    ticket_no,
    book_ref,
    passenger_id,
    passenger_name,
    contact_data
from 
    {{ ref('stg_flights__tickets') }}
where passenger_id not in (select passenger_id from {{ ref('fct_dict_airline_worker') }})