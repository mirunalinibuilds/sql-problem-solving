# 1789. Primary Department for Each Employee

## 📌 Problem

Given the `Employee` table, find the **primary department** for each employee.

Rules:

- If an employee belongs to **multiple departments**, return the department where `primary_flag = 'Y'`.
- If an employee belongs to **only one department**, return that department regardless of the `primary_flag`.

Return the result in any order.

---

## 💡 Approach

There are two possible cases for each employee:

1. The employee belongs to **multiple departments**.
   - Select the department where `primary_flag = 'Y'`.

2. The employee belongs to **only one department**.
   - Since there is only one department, it is automatically considered the primary department.

### Steps

1. Select employees whose `primary_flag` is `'Y'`.

2. Find employees that appear only once using:
   - `GROUP BY employee_id`
   - `HAVING COUNT(employee_id) = 1`

3. Include those employees using the `IN` operator.

4. Return the corresponding `employee_id` and `department_id`.

---

## 🧠 Key Concepts Learned

- `WHERE`
- `OR`
- `IN`
- Subquery
- `GROUP BY`
- `COUNT()`
- `HAVING`

---

## 🔍 SQL Query

```sql
SELECT employee_id , department_id
FROM Employee
WHERE primary_flag = 'Y' OR employee_id IN (
SELECT employee_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1);
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Employee` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(N)

---

## ✅ What I Learned

- `GROUP BY` groups rows belonging to the same employee.
- `COUNT()` determines how many departments each employee belongs to.
- `HAVING` filters groups based on aggregate conditions.
- A subquery can identify employees satisfying a grouping condition.
- `IN` allows filtering rows using the result of a subquery.
- Multiple conditions can be combined using `OR`.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Identify special cases using aggregation → Filter with a subquery → Combine conditions using `OR`.**

This pattern frequently appears in scenarios such as:

- Selecting default records
- Finding unique entries
- Handling exception cases
- Choosing preferred records
- Filtering based on group statistics

---

## 🚀 Key Takeaway

When solving SQL problems involving multiple conditions:

1. Identify the different cases described in the problem.
2. Solve each case independently.
3. Use aggregation (`GROUP BY` + `HAVING`) to identify special groups.
4. Combine the conditions using logical operators such as `OR`.

Breaking the problem into independent cases often leads to a much simpler and more readable SQL solution.

---

## 🌟 Advanced SQL (Window Function Alternative)

This problem can also be solved using a window function.

### Window Function Used

- `COUNT(*) OVER (PARTITION BY employee_id)`

### Idea

1. Count the number of departments for each employee without grouping the rows.
2. Keep rows where:
   - `primary_flag = 'Y'`, or
   - The department count is `1`.

### Why Learn This?

Window functions calculate aggregate values while preserving every row, eliminating the need for a separate grouping subquery.

> **Learning:** `COUNT(*) OVER(PARTITION BY ...)` is a powerful alternative to `GROUP BY` when you need aggregate information without collapsing rows.
