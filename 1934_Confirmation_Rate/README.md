# 1934. Confirmation Rate

## 📌 Problem

Given the `Signups` and `Confirmations` tables, calculate the **confirmation rate** for each user.

The confirmation rate is defined as:

```
(Number of confirmed messages) / (Total confirmation requests)
```

- If a user has **no confirmation requests**, their confirmation rate is **0**.
- Round the result to **2 decimal places**.

---

## 💡 Approach

The required information is spread across two tables:

- `Signups` contains all registered users.
- `Confirmations` contains the confirmation requests and their outcomes.

To compute the confirmation rate for every user:

### Steps

1. Perform a **LEFT JOIN** between `Signups` and `Confirmations` using `user_id`.
   - This ensures users with no confirmation records are still included.

2. Use a `CASE WHEN` expression to convert each confirmation record into:
   - `1` if the action is `'confirmed'`
   - `0` otherwise

3. Use `SUM()` to count the total confirmed actions.

4. Divide the confirmed count by the total number of confirmation requests using `COUNT(*)`.

5. Round the result to **2 decimal places**.

6. Use `COALESCE()` to return `0` for users with no confirmation records.

---

## 🧠 Key Concepts Learned

- `LEFT JOIN`
- `CASE WHEN`
- Conditional Aggregation
- `SUM()`
- `COUNT()`
- `ROUND()`
- `COALESCE()`
- `GROUP BY`

---

## 🔍 SQL Query

```sql
SELECT s.user_id ,
COALESCE(ROUND((SUM(CASE
            WHEN action = 'confirmed' THEN 1
            ELSE 0
            END)) / COUNT(*),2),0) AS confirmation_rate       
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY user_id;
```

---

## ⏱️ Complexity

Let:

- **S** = Number of users in `Signups`
- **C** = Number of rows in `Confirmations`

- **Time Complexity:** O(S + C)
- **Space Complexity:** O(S)

---

## ✅ What I Learned

- `LEFT JOIN` keeps all users, even those without confirmation records.
- `CASE WHEN` adds conditional logic directly into SQL queries.
- Conditional aggregation (`SUM(CASE WHEN ...)`) is a powerful technique for counting records that satisfy a condition.
- `COALESCE()` replaces `NULL` values with a default value.
- Aggregate functions can be combined to compute ratios and percentages.

---

## 🎯 Interview Pattern

This problem introduces one of the most common SQL interview patterns:

> **Join tables → Apply conditional aggregation → Compute a ratio → Handle missing values.**

This pattern is frequently used in scenarios such as:

- Order completion rate
- Email open rate
- Login success rate
- Payment success rate
- Customer conversion rate
- Task completion rate

---

## 🚀 Key Takeaway

When a problem asks for a percentage or rate:

1. Join the required tables.
2. Use `CASE WHEN` to identify records that satisfy the condition.
3. Apply conditional aggregation using `SUM(CASE WHEN ...)`.
4. Compute the required ratio.
5. Use `COALESCE()` (or `IFNULL()`) to handle missing values gracefully.
6. Format the result using `ROUND()` if required.

Conditional aggregation is one of the most valuable SQL techniques for interview preparation and real-world data analysis.
