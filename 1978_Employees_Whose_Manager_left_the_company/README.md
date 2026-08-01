# 1978. Employees Whose Manager Left the Company

## 📌 Problem

Given the `Employees` table, find the **employee IDs** of employees:

- Whose **manager has left the company**.
- Whose **salary is less than 30000**.

Return the result ordered by `employee_id` in ascending order.

---

## 💡 Approach

To determine whether a manager has left the company, we need to check if an employee's `manager_id` no longer exists as an `employee_id` in the table.

### Steps

1. Retrieve all existing employee IDs using a subquery.

2. Select employees whose `manager_id` is **not present** in the list of current employee IDs.

3. Filter employees with a salary less than **30000**.

4. Sort the result by `employee_id` in ascending order.

---

## 🧠 Key Concepts Learned

- `WHERE`
- `NOT IN`
- Subquery
- `ORDER BY`
- Filtering with Multiple Conditions

---

## 🔍 SQL Query

```sql
SELECT
    employee_id
FROM Employees
WHERE manager_id NOT IN (
    SELECT employee_id
    FROM Employees
)
AND salary < 30000
ORDER BY employee_id;
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Employees` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(N) for the employee ID set used by the subquery.

---

## ✅ What I Learned

- `NOT IN` is used to find values that do not exist in another result set.
- A subquery can provide a list of values for comparison.
- Multiple conditions can be combined using `AND`.
- `ORDER BY` sorts the final output in ascending order by default.
- SQL can identify missing relationships by comparing values within the same table.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Retrieve a set of valid values → Use `NOT IN` to find missing references → Apply additional filters.**

This pattern frequently appears in scenarios such as:

- Employees with invalid managers
- Customers without orders
- Products never purchased
- Students not enrolled in any course
- Records with missing foreign key references

---

## 🚀 Key Takeaway

When a problem asks for records that reference **non-existent data**:

1. Build the list of valid values using a subquery.
2. Use `NOT IN` (or `NOT EXISTS`) to identify missing references.
3. Apply any additional filtering conditions.
4. Sort the results if required.

Recognizing the **Reference Check → Filter → Return** pattern is useful for solving many SQL interview problems involving data integrity.

---

## 🌟 Advanced SQL (Alternative Approach)

This problem can also be solved using a `LEFT JOIN`.

### Alternative Idea

1. Join each employee with their manager.
2. If the manager record is `NULL` after the join, the manager no longer exists.
3. Filter employees with salary less than `30000`.

This approach avoids `NOT IN` and is commonly used in production SQL when checking for missing relationships.

> **Learning:** Problems involving missing related records can often be solved using either **`NOT IN`**, **`NOT EXISTS`**, or a **`LEFT JOIN ... IS NULL`** pattern.
