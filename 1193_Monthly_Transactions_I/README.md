# 1193. Monthly Transactions I

## 📌 Problem

Given the `Transactions` table, generate a monthly report for each country containing:

- Total number of transactions
- Total transaction amount
- Number of approved transactions
- Total amount of approved transactions

Return one row for each **month-country** combination.

---

## 💡 Approach

The report needs to summarize transaction data **for each month and country**.

### Steps

1. Extract the month from `trans_date` using `DATE_FORMAT()`.

2. Group the transactions by:
   - Month
   - Country

3. Count the total number of transactions using `COUNT(*)`.

4. Calculate the total transaction amount using `SUM(amount)`.

5. Count approved transactions using conditional aggregation:

   - Return `1` for approved transactions.
   - Return `0` otherwise.
   - Sum the values.

6. Calculate the total approved amount using another conditional aggregation:

   - Return `amount` for approved transactions.
   - Return `0` otherwise.
   - Sum the values.

---

## 🧠 Key Concepts Learned

- `DATE_FORMAT()`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `CASE WHEN`
- Conditional Aggregation
- Multiple Aggregate Functions

---

## 🔍 SQL Query

```sql
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(amount) AS trans_total_amount,
    SUM(
        CASE
            WHEN state = 'approved' THEN 1
            ELSE 0
        END
    ) AS approved_count,
    SUM(
        CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
        END
    ) AS approved_total_amount
FROM Transactions
GROUP BY
    DATE_FORMAT(trans_date, '%Y-%m'),
    country;
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Transactions` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(M × C), where:
  - **M** = Number of unique months
  - **C** = Number of unique countries

---

## ✅ What I Learned

- `DATE_FORMAT()` extracts specific parts of a date for grouping.
- Multiple columns can be used together in `GROUP BY`.
- Conditional aggregation allows multiple statistics to be computed in a single query.
- `SUM(CASE WHEN ...)` can count matching rows or sum values based on a condition.
- A single SQL query can generate several summary metrics efficiently.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Extract date components → Group by multiple columns → Compute multiple aggregate metrics using conditional aggregation.**

This pattern frequently appears in scenarios such as:

- Monthly sales reports
- Country-wise revenue analysis
- Department-wise employee statistics
- Daily website analytics
- Quarterly financial summaries
- Business intelligence dashboards

---

## 🚀 Key Takeaway

When building summary reports in SQL:

1. Extract the required date component if needed.
2. Group by all required dimensions.
3. Use aggregate functions to calculate totals and counts.
4. Apply `CASE WHEN` inside aggregates for conditional metrics.
5. Compute multiple statistics in a single query for efficient reporting.

Recognizing the **Group → Aggregate → Conditional Aggregate** pattern is essential for solving reporting and analytics problems in SQL.
