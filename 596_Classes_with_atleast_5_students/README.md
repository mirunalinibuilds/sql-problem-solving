# 596. Classes With at Least 5 Students

## 🧩 Problem
Given a table containing student enrollments, find all classes that have **at least five students** enrolled.

---

## 💡 Approach
Since we need to determine how many students belong to each class:

- Group all rows by `class`.
- Count the number of students in each class.
- Keep only those classes where the student count is **greater than or equal to 5**.

---

## 🛠️ SQL Query

```sql
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
```

---

## 🔍 Explanation

### `GROUP BY class`
Groups all records belonging to the same class together.

### `COUNT(student)`
Counts the number of students in each class.

### `HAVING COUNT(student) >= 5`
Filters the grouped results, returning only classes with **5 or more students**.

> `HAVING` is used because filtering is done **after** grouping.

---

## ⏱️ Complexity

- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(k)`

Where:
- `n` = total number of records in the `Courses` table
- `k` = number of unique classes

---

## 🎯 SQL Concepts Practiced

- `GROUP BY`
- Aggregate Functions (`COUNT`)
- `HAVING` Clause
- Filtering Aggregated Data

---

⭐ A straightforward aggregation problem that reinforces the difference between **`WHERE`** and **`HAVING`** in SQL.
