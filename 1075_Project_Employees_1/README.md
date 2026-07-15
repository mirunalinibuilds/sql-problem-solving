# 1075. Project Employees I

## 📌 Problem

Given the `Project` and `Employee` tables, calculate the **average experience years** of employees working on each project.

Return the result with:

- `project_id`
- `average_years` (rounded to **2 decimal places**)

---

## 💡 Approach

The required information is spread across two tables:

- `Project` contains the mapping between employees and projects.
- `Employee` contains each employee's years of experience.

To compute the average experience for each project:

### Steps

1. Perform an **INNER JOIN** between the `Project` and `Employee` tables using `employee_id`.

2. This combines each project assignment with the corresponding employee's experience.

3. Group the records by `project_id`.

4. Calculate the average experience using `AVG()`.

5. Round the result to **2 decimal places** using `ROUND()`.

---

## 🧠 Key Concepts Learned

- `INNER JOIN`
- Join Conditions
- `AVG()`
- `GROUP BY`
- `ROUND()`
- Aggregate Functions

---

## 🔍 SQL Query

```sql
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
INNER JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;
```

---

## ⏱️ Complexity

Let:

- **P** = Number of rows in the `Project` table
- **E** = Number of rows in the `Employee` table

- **Time Complexity:** O(P + E) *(assuming indexed joins)*
- **Space Complexity:** O(1) *(excluding database execution overhead)*

---

## ✅ What I Learned

- `INNER JOIN` combines related data from multiple tables using a common key.
- Aggregate functions like `AVG()` calculate summary statistics for grouped records.
- `GROUP BY` creates one result row for each project.
- `ROUND()` formats numerical output to the required precision.
- SQL queries often combine data from one table with attributes from another before performing aggregation.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Join related tables → Group the data → Apply an aggregate function.**

This pattern is widely used in scenarios such as:

- Department-wise average salaries
- Customer-wise total purchases
- Project-wise employee statistics
- Team performance analysis
- Store-wise sales reports

---

## 🚀 Key Takeaway

Whenever a problem requires information stored across multiple tables:

1. Identify the common key.
2. Join the tables.
3. Group the data based on the required output.
4. Apply the appropriate aggregate function (`AVG`, `COUNT`, `SUM`, `MAX`, etc.).
5. Format the result if needed using functions like `ROUND()`.
