# 586. Customer Placing the Largest Number of Orders

## 📌 Problem Statement

Given the `Orders` table, find the `customer_number` of the customer who has placed the highest number of orders.

It is guaranteed that exactly one customer has placed more orders than any other customer.

---

## 💡 Approach

1. Group all orders by `customer_number`.
2. Count the number of orders for each customer using `COUNT(*)`.
3. Sort the grouped results in descending order based on the order count.
4. Return the first customer using `LIMIT 1`.

---

## 🧠 Intuition

The key idea is to **group similar records together** and perform an **aggregate operation** on each group.

* `GROUP BY` creates one group for each customer.
* `COUNT(*)` calculates how many orders each customer placed.
* `ORDER BY COUNT(*) DESC` brings the customer with the highest count to the top.
* `LIMIT 1` returns only that customer.

---

## ✅ MySQL Solution

```sql
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;
```

---

## ⏱️ Time Complexity

* **Grouping:** O(N)
* **Sorting:** O(M log M), where **M** is the number of unique customers.

Overall Complexity:

```text
O(N + M log M)
```

---

## 💾 Space Complexity

```text
O(M)
```

where **M** is the number of unique customers stored during grouping.

---

## 📚 Key Concepts Learned

* `GROUP BY`
* `COUNT(*)`
* Aggregate Functions
* `ORDER BY`
* `LIMIT`
* Solving frequency-based SQL problems

---

## 🚀 Takeaway

Whenever a problem asks for the **most**, **least**, **highest**, or **lowest** occurrence of a category:

* Group the records.
* Apply an aggregate function (`COUNT`, `SUM`, `AVG`, etc.).
* Sort the aggregated result.
* Return the required record using `LIMIT`.
