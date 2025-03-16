{% set source_relation = load_relation( ref("stg_flights__flights")) %}

{% set columns = adapter.get_columns_in_relation(source_relation) %}

{% for column in columns -%}
    {{'Columns: ' ~ column }}
{% endfor %}