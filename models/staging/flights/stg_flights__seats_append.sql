{{
  config(
    materialized = 'table'
    )
}}
WITH stg_flights__seats AS (
    {{ safe_select('stg_flights__seats') }}
)
SELECT * FROM stg_flights__seats