# 197. Rising Temperature

## 📌 Problem

Given the `Weather` table, find the **IDs of all dates** where the temperature was **higher than the previous day's temperature**.

---

## 💡 Approach

Since each day's temperature needs to be compared with **another row in the same table**, this problem is solved using a **Self Join**.

### Steps

1. Create two aliases of the `Weather` table:
   - `w1` → Current day's record
   - `w2` → Previous day's record

2. Join the rows where the dates differ by exactly **one day**.

3. Compare the temperatures of the matched rows.

4. Return the `id` of the current day when its temperature is higher than the previous day's.

---

## 🧠 Key Concepts Learned

- Self Join
- Table Aliases (`w1`, `w2`)
- `DATEDIFF()`
- `INNER JOIN`
- `WHERE` filtering
- Comparing values across rows

---

## 🔍 SQL Query

```sql
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
```

---

## ⏱️ Complexity

- **Time:** O(n²) (conceptually, though databases optimize joins using indexes when available)
- **Space:** O(1) (excluding database execution overhead)

---

## ✅ What I Learned

- A **Self Join** allows a table to be compared with itself by using aliases.
- `DATEDIFF()` helps identify rows that are exactly one day apart.
- `JOIN` is used to pair related rows, while `WHERE` filters the matched results.
- Thinking in terms of **relationships between rows** is often the key to solving SQL interview problems.

---

> **Interview Pattern:** Whenever a problem asks you to compare a row with another row in the **same table** (previous day, next day, employee-manager, etc.), consider using a **Self Join**.
