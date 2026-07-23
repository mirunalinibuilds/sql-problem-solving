# 1729. Find Followers Count

## 📌 Problem

Given the `Followers` table, find the **number of followers** for each user.

Return the result with:

- `user_id`
- `followers_count`

The output should be ordered by `user_id`.

---

## 💡 Approach

Each row in the `Followers` table represents a relationship where one user follows another.

To determine the number of followers for each user:

### Steps

1. Group all records by `user_id`.

2. Count the number of `follower_id` values within each group using `COUNT()`.

3. Rename the count as `followers_count`.

4. Sort the final result by `user_id`.

---

## 🧠 Key Concepts Learned

- `GROUP BY`
- `COUNT()`
- Aggregate Functions
- `ORDER BY`

---

## 🔍 SQL Query

```sql
SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Followers` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(U), where **U** is the number of unique users (for grouping)

---

## ✅ What I Learned

- `GROUP BY` groups all rows belonging to the same user.
- `COUNT(column)` counts the number of non-NULL values in each group.
- Aggregate functions summarize data without requiring loops.
- `ORDER BY` arranges the final output in ascending order of `user_id`.

---

## 🎯 Interview Pattern

This problem demonstrates a fundamental SQL interview pattern:

> **Group records → Apply an aggregate function → Sort the result.**

This pattern frequently appears in scenarios such as:

- Number of orders per customer
- Employees per department
- Students per class
- Products per category
- Posts per user
- Bookings per hotel

---

## 🚀 Key Takeaway

When a problem asks for a **count for each entity**, follow this approach:

1. Identify the grouping column.
2. Use `GROUP BY` on that column.
3. Apply `COUNT()` to calculate the total records in each group.
4. Use `ORDER BY` if the output requires a specific sorting.

This is one of the most common SQL patterns used in interviews and real-world reporting queries.
