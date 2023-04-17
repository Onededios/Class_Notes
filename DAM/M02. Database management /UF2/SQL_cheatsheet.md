# SQL Cheatsheet

## Create a new database

```sql
CREATE DATABASE database_name;
```

## Querying data from a table

### Query data in columns c1, c2 from a table

```sql
SELECT c1, c2 FROM t;
```

### Query all rows and columns from a table

```sql
SELECT * FROM t;
```

### Query data and filter rows with a condition

```sql
SELECT c1, c2 FROM t
WHERE condition;
```

### Query distinct rows from a table

```sql
SELECT DISTINCT c1 FROM t
WHERE condition;
```

### Sort the result set in ascending or descending order

```sql
SELECT c1, c2 FROM t
ORDER BY c1 ASC;
```

```sql
SELECT c1, c2 FROM t
ORDER BY c1 DESC;
```

### Skip offset of rows and return the next n rows

```sql
SELECT c1, c2 FROM t
ORDER BY c1 
LIMIT n OFFSET offset;
```

### Group rows using an aggregate function

```sql
SELECT c1, aggregate(c2)
FROM t
GROUP BY c1;
```

### Filter groups using HAVING clause

```sql
SELECT c1, aggregate(c2)
FROM t
GROUP BY c1
HAVING condition;
```

## Querying from multiple tables

### Inner join t1 and t2

```sql
SELECT c1, c2 
FROM t1
INNER JOIN t2 ON condition;
```

### Left join t1 and t1

```sql
SELECT c1, c2 
FROM t1
LEFT JOIN t2 ON condition;
```

### Right join t1 and t2

```sql
SELECT c1, c2 
FROM t1
RIGHT JOIN t2 ON condition;
```

### Perform full outer join

```sql
SELECT c1, c2 
FROM t1
FULL OUTER JOIN t2 ON condition;
```

### Produce a Cartesian product of rows in tables

```sql
SELECT c1, c2 
FROM t1
CROSS JOIN t2;
```

### Return the intersection of two queries

```sql
SELECT c1, c2 FROM t1
INTERSECT
SELECT c1, c2 FROM t2;
```

### Subtract a result set from another result set

```sql
SELECT c1, c2 FROM t1
MINUS
SELECT c1, c2 FROM t2;
```

### Query rows using pattern matching %, _

```sql
SELECT c1, c2 FROM t1
WHERE c1 LIKE pattern;
```

### Query rows in a list

```sql
SELECT c1, c2 FROM t
WHERE c1 IN value_list;
```

### Query rows between two values

```sql
SELECT c1, c2 FROM t
WHERE  c1 BETWEEN low AND high;
```

### Check if values in a table is NULL or not

```sql
SELECT c1, c2 FROM t
WHERE  c1 IS NULL;
```

## Managing tables

### Create a new table with three columns

```sql
CREATE TABLE t (
     id INT PRIMARY KEY,
     name VARCHAR NOT NULL,
     price INT DEFAULT 0
);
```

### Delete the table from the database

```sql
DROP TABLE t ;
```

### Add a new column to the table

```sql
ALTER TABLE t ADD column;
```

### Drop column c from the table

```sql
ALTER TABLE t DROP COLUMN c ;
```

### Add a constraint

```sql
ALTER TABLE t ADD constraint;
```

### Drop a constraint

```sql
ALTER TABLE t DROP constraint;
```

### Rename a table from t1 to t2

```sql
ALTER TABLE t1 RENAME TO t2;
```

### Rename column c1 to c2

```sql
ALTER TABLE t1 RENAME c1 TO c2 ;
```

### Remove all data in a table

```sql
TRUNCATE TABLE t;
```

## Modifying Data

### Insert one row into a table

```sql
INSERT INTO t(column_list)
VALUES(value_list);
```

### Insert multiple rows into a table

```sql
INSERT INTO t(column_list)
VALUES (value_list), 
       (value_list), …;
```

### Insert rows from t2 into t1

```sql
INSERT INTO t1(column_list)
SELECT column_list
FROM t2;
```

### Update new value in the column c1 for all rows

```sql
UPDATE t
SET c1 = new_value;
```

### Update values in the column c1, c2 that match the condition

```sql
UPDATE t
SET c1 = new_value, 
        c2 = new_value
WHERE condition;
```

### Delete all data in a table

```sql
DELETE FROM t;
```

### Delete subset of rows in a table

```sql
DELETE FROM t
WHERE condition;
```

## Managing Views

### Create a new view that consists  of c1 and c2

```sql
CREATE VIEW v(c1,c2) 
AS
SELECT c1, c2
FROM t;
```

### Create a new view with check option

```sql
CREATE VIEW v(c1,c2) 
AS
SELECT c1, c2
FROM t;
WITH CHECK OPTION;
```

### Create a recursive view

```sql
CREATE RECURSIVE VIEW v 
AS
select-statement -- anchor part
UNION [ALL]
select-statement; -- recursive part
```

### Create a temporary view

```sql
CREATE TEMPORARY VIEW v 
AS
SELECT c1, c2
FROM t;
```

### Delete a view

```sql
DROP VIEW view_name;
```

## Backup a database

### Create a backup of a database

```sql
pg_dump --username=postgres dbname > backup.sql
```

### Restore a database from a backup

```sql
psql --username=postgres dbname < backup.sql
```