
{{
  config(
    materialized = 'table',
    pre_hook = '
        {% set data_today = run_started_at|string()|truncate(19, True, "") %}

        {% set backup_relation = api.Relation.create(
            database = this.database,
            schema = this.schema,
            identifier = this.identifier ~ "_[" ~ data_today ~ "]",
            type = "table" 
          )
        %}
        
        {% do adapter.rename_relation(this, backup_relation) %}
    '
  )
}}
select 
    aircraft_code,
    model, 
    "range"
from 
    {{ source('demo_src', 'aircrafts') }}