# 511. Game Play Analysis I

## 📌 Problem Statement

Given the `Activity` table, find the **first login date** for each player.

Return the `player_id` along with the earliest `event_date` for every player.

---

## 💡 Approach

1. Group all records by `player_id`.
2. Use the `MIN()` aggregate function to find the earliest `event_date` within each group.
3. Rename the result as `first_login` using an alias.

---

## 🧠 Intuition

Each player can have multiple login records on different dates.

Instead of checking every row manually, we can:

* Group all records belonging to the same player.
* Find the **minimum (earliest)** login date within each group.

This is a common SQL pattern used to find the **first**, **earliest**, **minimum**, or **oldest** record for every entity.

---

## ✅ MySQL Solution

```sql
SELECT player_id,
       MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
```

---

## ⏱️ Time Complexity

The database scans every row once while grouping the records.

```text
O(N)
```

where **N** is the total number of rows in the `Activity` table.

---

## 💾 Space Complexity

```text
O(P)
```

where **P** is the number of unique players created during grouping.

---

## 📚 Key Concepts Learned

* `GROUP BY`
* `MIN()`
* Aggregate Functions
* Column Aliases (`AS`)
* Finding the earliest record per group

---

## 🚀 Takeaway

When a SQL problem asks for the **first**, **earliest**, **minimum**, or **oldest** record for each entity:

* Group the records using `GROUP BY`.
* Apply the `MIN()` aggregate function.
* Use an alias to make the output more readable.

This "first record per group" pattern is extremely common in SQL interviews and serves as a foundation for more advanced topics like **JOINs**, **Subqueries**, and **Window Functions**.
