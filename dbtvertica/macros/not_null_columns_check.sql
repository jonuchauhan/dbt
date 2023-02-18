{% macro not_null_columns_check(model) %}
    SELECT * FROM {{model}} where 
    {% for col in dbt.get_columns_in_relation(model) -%}
        {{col.column}} is null  or 
      
    {% endfor %}
    FALSE
  
{% endmacro %}