{% set status_query %}
SELECT DISTINCT
    status
FROM {{ ref('stg_flights__flights') }}
{% endset %}

{% set status_query_result = run_query(status_query) %}
{% if execute %}

    {% set all_status = status_query_result.columns[0].values() %}
{% else %} 
    {% set all_status = [] %}
{% endif %}

SELECT 
   {% for status in all_status %}
    SUM(CASE WHEN status = '{{ status }}' THEN 1 ELSE 0 END) as "{{ status }}"
        {%- if not loop.last %}, {% endif %}
   {% endfor %}
FROM 
    {{ ref('stg_flights__flights') }}