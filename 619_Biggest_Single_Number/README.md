# 619. Biggest Single Number

## 📌 Problem

Given the `MyNumbers` table, find the **largest number** that appears **exactly once**.

If there is no such number, return `NULL`.

---

## 💡 Approach

To solve the problem, we first identify all numbers that occur exactly once. Then, among those numbers, we find the largest one.

### Steps

1. Group the records by `num`.

2. Count the occurrences of each number using `COUNT(*)`.

3. Keep only the numbers that appear exactly once using `HAVING COUNT(*) = 1`.

4. Use the resulting numbers in the outer query with the `IN` operator.

5. Find the largest number using `MAX()`.

---

## 🧠 Key Concepts Learned

- `GROUP BY`
- `COUNT(*)`
- `HAVING`
- `MAX()`
- Subquery
- `IN`
- Aggregate Functions

---

## 🔍 SQL Query

```sql
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
);
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `MyNumbers` table

- **Time Complexity:** O(N)
- **Space Complexity:** O(U), where **U** is the number of unique numbers.

---

## ✅ What I Learned

- `GROUP BY` groups identical values together.
- `COUNT(*)` counts the number of occurrences of each value.
- `HAVING` filters groups based on aggregate conditions.
- `MAX()` returns the largest value from a set of numbers.
- A subquery can be used to filter data before applying another aggregate function.
- SQL queries can combine multiple aggregate operations in different stages to solve complex problems.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Group records → Filter groups using `HAVING` → Apply another aggregate function on the filtered result.**

This pattern frequently appears in scenarios such as:

- Largest unique salary
- Highest one-time purchase
- Most expensive product sold only once
- Customer with a unique highest score
- Maximum value satisfying an aggregate condition

---

## 🚀 Key Takeaway

When a problem asks for the **maximum (or minimum) value** that satisfies an aggregate condition:

1. Group the data.
2. Use aggregate functions like `COUNT()` to identify the desired groups.
3. Filter the groups using `HAVING`.
4. Apply another aggregate function (`MAX()` or `MIN()`) to obtain the final answer.

Recognizing the **Group → Filter → Aggregate Again** pattern is an important SQL interview skill.

---

## 🌟 Advanced SQL (Window Function Alternative)

This problem can also be solved using a window function.

### Window Function Used

- `COUNT(*) OVER (PARTITION BY num)`

### Idea

1. Count the occurrences of each number without grouping the rows.
2. Keep only the rows where the occurrence count is `1`.
3. Use `MAX()` to find the largest remaining number.

### Why Learn This?

Window functions preserve the original rows while still allowing aggregate calculations, making them extremely useful for advanced SQL problems involving ranking, filtering, and analytics.

> **Learning:** `COUNT() OVER(PARTITION BY ...)` computes aggregate values for each group without collapsing the result set.
