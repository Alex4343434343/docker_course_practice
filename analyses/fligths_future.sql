{% set data_today = run_started_at|string() %}

SELECT 
    COUNT(scheduled_departure)
FROM {{ ref('fct_flights') }}
WHERE scheduled_departure >= '{{ data_today|truncate(10, True, "") }}'
