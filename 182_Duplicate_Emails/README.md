# Duplicate Emails - LeetCode Solution

A MySQL query to find all duplicate email addresses in a database table.

## Problem Description

Given a table named `Person`, write a SQL query to find all duplicate emails.

### Table Schema: Person

| Column Name | Type    |
| :---        | :---    |
| id          | int     |
| email       | varchar |

* `id` is the primary key column for this table.
* Each row contains an email address. The emails will not contain uppercase letters.

### Example

**Input Table:**

| id | email            |
| :- | :---             |
| 1  | a@b.com          |
| 2  | c@d.com          |
| 3  | a@b.com          |

**Output:**

| Email   |
| :---    |
| a@b.com |

## Solution

The objective is to find emails that appear more than once. This is achieved by grouping the rows by the `email` column and filtering groups that have a row count greater than 1.

### MySQL Query

```sql
# Write your MySQL query statement below
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
```

### Explanation

1. **`FROM Person`**: Specifies the target table.
2. **`GROUP BY email`**: Combines rows that share identical email addresses into distinct groups.
3. **`HAVING COUNT(*) > 1`**: Filters the grouped results. The `HAVING` clause functions like a `WHERE` clause but is applied after aggregation, keeping only groups containing more than one record.
4. **`SELECT email AS Email`**: Retrieves the filtered email addresses and aliases the column header as `Email` to match the required output schema.

## Complexity

* **Time Complexity**: $O(N)$ where $N$ is the total number of rows in the `Person` table. The database must scan the table to group the records.
* **Space Complexity**: $O(M)$ where $M$ is the number of unique email addresses stored in memory during the grouping process.
