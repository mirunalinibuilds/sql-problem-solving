# 2356. Number of Unique Subjects Taught by Each Teacher

## 📌 Problem

Given the `Teacher` table, find the **number of unique subjects** taught by each teacher.

Return the result with:

- `teacher_id`
- `cnt` (the number of distinct subjects taught)

---

## 💡 Approach

A teacher may have multiple records for the same subject because they can teach different classes. Therefore, simply counting rows would overcount the number of subjects.

### Steps

1. Group the records by `teacher_id`.

2. Use `COUNT(DISTINCT subject_id)` to count only unique subjects taught by each teacher.

3. Return the teacher ID along with the count of distinct subjects.

---

## 🧠 Key Concepts Learned

- `GROUP BY`
- `COUNT()`
- `DISTINCT`
- Aggregate Functions

---

## 🔍 SQL Query

```sql
SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Teacher` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(T), where **T** is the number of unique teachers (for grouping)

---

## ✅ What I Learned

- `GROUP BY` groups rows based on a specific column before applying aggregate functions.
- `COUNT(DISTINCT column)` counts only unique, non-NULL values within each group.
- `DISTINCT` helps eliminate duplicate values before aggregation.
- Choosing the correct aggregate function is essential when duplicate records are present.

---

## 🎯 Interview Pattern

This problem introduces a common SQL interview pattern:

> **Group records → Remove duplicates → Apply an aggregate function.**

You'll encounter this pattern in scenarios such as:

- Number of unique products purchased by each customer
- Unique courses enrolled by each student
- Distinct cities served by each delivery partner
- Different skills possessed by each employee
- Unique categories sold by each store

---

## 🚀 Key Takeaway

When a problem asks for the **number of unique values** within each group:

1. Use `GROUP BY` to form the groups.
2. Use `COUNT(DISTINCT column)` to count only unique values.
3. Return the grouped column along with the aggregated result.

This combination is one of the most frequently used SQL patterns in interviews.
