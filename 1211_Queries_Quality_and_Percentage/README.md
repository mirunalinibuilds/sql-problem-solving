# 1211. Queries Quality and Percentage

## 📌 Problem

Given the `Queries` table, calculate the following for each `query_name`:

- **Quality** = Average of `(rating / position)`
- **Poor Query Percentage** = Percentage of queries with a rating less than `3`

Round both values to **2 decimal places**.

---

## 💡 Approach

For each query name, we need to compute two metrics by grouping all related records.

### Steps

1. Group all records by `query_name`.

2. Calculate the **quality** by:
   - Computing `rating / position` for every row.
   - Summing these values using `SUM()`.
   - Dividing by the total number of queries using `COUNT(*)`.

3. Calculate the **poor query percentage** by:
   - Using `CASE WHEN` to convert:
     - Ratings less than `3` → `1`
     - Otherwise → `0`
   - Summing these values to count poor queries.
   - Dividing by the total number of queries.
   - Multiplying by `100` to convert the ratio into a percentage.

4. Round both results to **2 decimal places** using `ROUND()`.

---

## 🧠 Key Concepts Learned

- `GROUP BY`
- `SUM()`
- `COUNT()`
- `CASE WHEN`
- Conditional Aggregation
- Aggregate Arithmetic
- `ROUND()`

---

## 🔍 SQL Query

```sql
SELECT
    query_name,
    ROUND(
        SUM(rating / position) / COUNT(*),
        2
    ) AS quality,
    ROUND(
        SUM(
            CASE
                WHEN rating < 3 THEN 1
                ELSE 0
            END
        ) * 100 / COUNT(*),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Queries` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(Q), where **Q** is the number of unique query names.

---

## ✅ What I Learned

- Aggregate functions can be applied to expressions, not just individual columns.
- `SUM(expression) / COUNT(*)` is equivalent to calculating the average of that expression.
- `CASE WHEN` combined with `SUM()` is a powerful way to perform conditional counting.
- Arithmetic operations can be performed directly on aggregate results.
- `GROUP BY` enables calculating multiple metrics for each group in a single query.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Group records → Compute row-level expressions → Aggregate the results → Calculate percentages using conditional aggregation.**

This pattern frequently appears in scenarios such as:

- Average product ratings
- Employee performance metrics
- Customer satisfaction scores
- Success and failure rates
- Conversion rate calculations
- Analytics dashboard reports

---

## 🚀 Key Takeaway

When a problem requires calculating averages or percentages over derived values:

1. Group the relevant records.
2. Compute the required expression for each row.
3. Apply aggregate functions like `SUM()` or `COUNT()` to summarize the results.
4. Use `CASE WHEN` for conditional counting.
5. Format the output using `ROUND()` if required.

Recognizing the **Row Expression → Aggregate → Final Metric** pattern makes many SQL interview questions much easier to solve.
