SELECT 
    aircraft_code,
    count(aircraft_code) as count_seat
FROM
    {{ ref('stg_flights__seats') }}
GROUP BY aircraft_code