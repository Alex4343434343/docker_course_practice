SELECT DISTINCT
    status
FROM {{ ref('stg_flights__flights') }}