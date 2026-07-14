# 1280. Students and Examinations

## 📌 Problem

Given the `Students`, `Subjects`, and `Examinations` tables, return the number of times **each student attended each subject exam**.

The result should include **every possible student-subject combination**, even if a student has **never attended** an exam for a subject.

Order the output by:

- `student_id`
- `subject_name`

---

## 💡 Approach

The key challenge is ensuring that **every student appears with every subject**, including cases where no examination record exists.

### Steps

1. Generate every possible **Student × Subject** combination using a **CROSS JOIN**.

2. Perform a **LEFT JOIN** with the `Examinations` table using:
   - `student_id`
   - `subject_name`

3. Since a `LEFT JOIN` preserves all student-subject combinations, students who never attended a particular subject will have `NULL` values in the examination columns.

4. Use `COUNT(e.subject_name)` to count the number of examinations attended.
   - `COUNT(column)` ignores `NULL` values, so combinations with no matching exam automatically return `0`.

5. Group the records by:
   - `student_id`
   - `student_name`
   - `subject_name`

6. Sort the final output by:
   - `student_id`
   - `subject_name`

---

## 🧠 Key Concepts Learned

- `CROSS JOIN`
- `LEFT JOIN`
- Multiple Join Conditions
- `COUNT()`
- `GROUP BY`
- `ORDER BY`
- Cartesian Product
- Handling Missing Data with `NULL`

---

## 🔍 SQL Query

```sql
SELECT
    s.student_id,
    s.student_name,
    su.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects su
LEFT JOIN Examinations e
ON s.student_id = e.student_id
AND su.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    su.subject_name
ORDER BY
    s.student_id,
    su.subject_name;
```

---

## ⏱️ Complexity

Let:

- **S** = Number of students
- **Sub** = Number of subjects
- **E** = Number of examination records

- **Time Complexity:** O(S × Sub + E)
- **Space Complexity:** O(S × Sub)

---

## ✅ What I Learned

- `CROSS JOIN` creates every possible combination between two tables.
- `LEFT JOIN` preserves all rows from the left table, even when there is no matching record.
- `COUNT(column)` ignores `NULL` values, making it ideal for counting related records after a `LEFT JOIN`.
- Multiple columns can be used together in a join condition to uniquely match records.
- `GROUP BY` is used to aggregate data for each unique student-subject pair.

---

## 🎯 Interview Pattern

This problem introduces a classic SQL interview pattern:

> **Generate all required combinations → Attach matching records → Aggregate the results.**

This pattern is commonly used in scenarios such as:

- Students and courses
- Customers and products
- Employees and projects
- Users and events
- Stores and products
- Categories and items

---

## 🚀 Key Takeaway

When a problem requires **showing rows even when no matching record exists**, think about:

- **`CROSS JOIN`** to generate all possible combinations.
- **`LEFT JOIN`** to retain combinations with missing matches.
- **`COUNT(column)`** to count existing records while treating missing ones as zero.
