# 1633. Percentage of Users Attended a Contest

## 📌 Problem

Given the `Users` and `Register` tables, find the **percentage of users** who registered for each contest.

Return the result with:

- `contest_id`
- `percentage` (rounded to **2 decimal places**)

Sort the result by:

- `percentage` in **descending** order.
- `contest_id` in **ascending** order if percentages are equal.

---

## 💡 Approach

To calculate the percentage of users who attended each contest, we need:

- The number of **unique users** registered for each contest.
- The **total number of users** in the `Users` table.

### Steps

1. Group the registration records by `contest_id`.

2. Count the number of unique registered users for each contest using `COUNT(DISTINCT user_id)`.

3. Retrieve the total number of users using a scalar subquery.

4. Calculate the percentage using:

   ```
   (Registered Users × 100) / Total Users
   ```

5. Round the result to **2 decimal places** using `ROUND()`.

6. Sort the output by percentage in descending order and `contest_id` in ascending order.

---

## 🧠 Key Concepts Learned

- `GROUP BY`
- `COUNT(DISTINCT)`
- Aggregate Functions
- Scalar Subquery
- `ROUND()`
- `ORDER BY`

---

## 🔍 SQL Query

```sql
SELECT
    contest_id,
    ROUND(
        COUNT(DISTINCT user_id) * 100 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
```

---

## ⏱️ Complexity

Let:

- **R** = Number of rows in the `Register` table
- **U** = Number of rows in the `Users` table

- **Time Complexity:** O(R + U)
- **Space Complexity:** O(C), where **C** is the number of unique contests.

---

## ✅ What I Learned

- `COUNT(DISTINCT column)` counts only unique values within each group.
- A **scalar subquery** returns a single value that can be used inside expressions.
- Aggregate functions can be combined with arithmetic operations to calculate percentages.
- `ROUND()` formats decimal values to the required precision.
- Multiple sorting conditions can be applied using `ORDER BY`.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Group records → Count unique values → Use a scalar subquery → Calculate a percentage → Sort the results.**

This pattern frequently appears in scenarios such as:

- Contest participation rate
- Customer conversion rate
- Student pass percentage
- Product purchase percentage
- Employee attendance percentage
- Survey response rate

---

## 🚀 Key Takeaway

When solving percentage-based SQL problems:

1. Identify the **numerator** (the required count).
2. Identify the **denominator** (the total count).
3. Use aggregate functions to compute the numerator.
4. Use a scalar subquery if the denominator comes from another table.
5. Calculate the percentage and round it if required.
6. Sort the results according to the problem statement.

The **Part ÷ Whole × 100** pattern is one of the most common SQL interview techniques.
