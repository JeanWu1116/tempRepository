
WITH   tableInfo  AS(
SELECT 
	table_name
FROM
	information_schema.tables	 
WHERE 	
	table_name  NOT LIKE '_$_%' 
	AND table_type='BASE TABLE'
	AND table_schema='public'
),columnInfo AS (
SELECT
table_name
,column_name
,ordinal_position
,data_type
,character_maximum_length
,column_default
,is_nullable
FROM
information_schema.columns
)SELECT columnInfo. * FROM   columnInfo
RIGHT JOIN tableInfo
on columnInfo.table_name=tableInfo.table_name
