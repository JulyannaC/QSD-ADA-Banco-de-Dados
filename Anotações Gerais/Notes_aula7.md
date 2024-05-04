# SQL UNION
Summary: this tutorial shows you how to use the SQL UNION to combine two or more result sets from multiple queries and explains the difference between UNION and UNION ALL.

## Introduction to SQL UNION operator
The UNION operator combines result sets of two or more SELECT statements into a single result set. The following statement illustrates how to use the UNION operator to combine result sets of two queries:

    SELECT 
        column1, column2
    FROM
        table1 
    UNION [ALL]
    SELECT 
        column3, column4
    FROM
        table2;


To use the UNION operator, you write the dividual SELECT statements and join them by the keyword UNION.

The columns returned by the SELECT statements must have the same or convertible data type, size, and be the same order.

The database system processes the query by executing two SELECT statements first. Then, it combines two individual result sets into one and eliminates duplicate rows. To eliminate the duplicate rows, the database system sorts the combined result set by every column and scans it for the matching rows located next to one another.

To retain the duplicate rows in the result set, you use the UNION ALL operator.