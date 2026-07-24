# 570. Managers with at Least 5 Direct Reports

## 📌 Problem

Given the `Employee` table, find the **names of managers** who have **at least five direct reports**.

Return the result table in any order.

---

## 💡 Approach

Instead of joining the table with itself, we can first identify the managers who supervise **at least five employees**, and then retrieve their names.

### Steps

1. Group all employees by `managerId`.

2. Count the number of employees reporting to each manager using `COUNT(*)`.

3. Filter only those managers having **5 or more direct reports** using `HAVING`.

4. Use the resulting manager IDs in the outer query with the `IN` operator.

5. Retrieve the corresponding manager names from the `Employee` table.

---

## 🧠 Key Concepts Learned

- `GROUP BY`
- `COUNT(*)`
- `HAVING`
- Subqueries
- `IN` Operator
- Aggregate Functions

---

## 🔍 SQL Query

```sql
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Employee` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(M), where **M** is the number of managers satisfying the condition.

---

## ✅ What I Learned

- `HAVING` is used to filter grouped data after aggregation.
- `COUNT(*)` counts the total number of rows within each group.
- A subquery can generate a list of values that can be reused in the outer query.
- The `IN` operator checks whether a value exists within a set returned by a subquery.
- Not every problem involving hierarchical data requires a self join; sometimes a subquery leads to a simpler and more readable solution.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Group records → Aggregate → Filter groups with `HAVING` → Use a subquery to retrieve the required data.**

You'll encounter this pattern in scenarios such as:

- Customers with more than *N* orders
- Products purchased by at least *N* customers
- Students enrolled in multiple courses
- Employees managing large teams
- Users with more than *N* followers

---

## 🚀 Key Takeaway

When a problem asks for entities that satisfy an **aggregate condition**:

1. Group the related records.
2. Compute the aggregate using functions like `COUNT()`, `SUM()`, or `AVG()`.
3. Filter the groups using `HAVING`.
4. Use the resulting values in a subquery (or a join) to fetch the final information.

This **Group → Aggregate → HAVING → Subquery** pattern is one of the most frequently tested SQL interview techniques.
