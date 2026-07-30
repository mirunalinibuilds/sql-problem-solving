# 1174. Immediate Food Delivery II

## 📌 Problem

Given the `Delivery` table, calculate the **percentage of customers whose first order was delivered on their preferred delivery date**.

Return the result as:

- `immediate_percentage` (rounded to **2 decimal places**)

---

## 💡 Approach

The problem only considers **each customer's first order**.

### Steps

1. Find the earliest order date for every customer using `MIN(order_date)`.

2. Filter the `Delivery` table to keep only those first-order records.

3. Compare the first order date with the customer's preferred delivery date.

4. Use `CASE WHEN` to convert:
   - Immediate delivery → `1`
   - Scheduled delivery → `0`

5. Sum all immediate deliveries.

6. Divide by the total number of first orders.

7. Multiply by `100` to obtain the percentage.

8. Round the result to **2 decimal places**.

---

## 🧠 Key Concepts Learned

- `MIN()`
- `GROUP BY`
- Row Constructor (`(col1, col2) IN (...)`)
- Subquery
- `CASE WHEN`
- Conditional Aggregation
- `SUM()`
- `COUNT()`
- `ROUND()`

---

## 🔍 SQL Query

```sql
SELECT
ROUND((SUM(CASE 
        WHEN order_date = customer_pref_delivery_date THEN 1
        ELSE 0
      END) / COUNT(*)) * 100,2) AS immediate_percentage
FROM Delivery
WHERE (customer_id , order_date) IN (SELECT customer_id ,MIN(order_date) FROM Delivery GROUP BY customer_id);
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Delivery` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(C), where **C** is the number of unique customers.

---

## ✅ What I Learned

- `MIN()` can be used with `GROUP BY` to identify the earliest record within each group.
- Aggregate functions are often used to **find rows**, not just calculate final answers.
- A subquery can return multiple columns using a **row constructor**:
  ```sql
  (customer_id, order_date) IN (...)
  ```
- `CASE WHEN` combined with `SUM()` performs conditional counting.
- Complex SQL problems can often be solved by breaking them into multiple logical steps.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Find the first (or last) record per group → Filter those records → Perform aggregation on the filtered result.**

This pattern frequently appears in scenarios such as:

- First order per customer
- First login per user
- Earliest transaction
- Latest purchase
- Highest salary per department
- Lowest score per student

---

## 🚀 Key Takeaway

When a problem asks about the **first**, **earliest**, **latest**, or **initial** record:

1. Use `MIN()` or `MAX()` with `GROUP BY` to identify the desired record.
2. Filter the original table to keep only those records.
3. Perform the required calculations on the filtered data.
4. Use conditional aggregation if percentages or counts are required.

Recognizing the **Find Row → Filter → Aggregate** pattern is an essential SQL interview skill.

---

## 🌟 Advanced SQL (Window Function Alternative)

This problem can also be solved using the `ROW_NUMBER()` window function.

### Window Function Used

- `ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date)`

### Idea

1. Assign a row number to each customer's orders based on the order date.
2. Keep only rows where `ROW_NUMBER() = 1` (the first order).
3. Compute the percentage using the same conditional aggregation.

### Why Learn This?

Window functions are widely used in production SQL because they often eliminate the need for subqueries and make "first/last/top N" problems easier to express.

> **Learning:** `ROW_NUMBER()` is the standard SQL solution for selecting the first or last record within each group.
