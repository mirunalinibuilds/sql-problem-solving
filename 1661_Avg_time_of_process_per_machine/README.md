# 1661. Average Time of Process per Machine

## 📌 Problem

Given the `Activity` table, calculate the **average processing time for each machine**.

Each process has exactly two records:
- `start`
- `end`

The processing time of a process is:

```
end_timestamp - start_timestamp
```

Return the average processing time for each machine rounded to **3 decimal places**.

---

## 💡 Approach

Since the `start` and `end` timestamps are stored in **separate rows**, we use a **Self Join** to combine them into a single logical record.

### Steps

1. Create two aliases of the `Activity` table:
   - `a1` → Start activity
   - `a2` → End activity

2. Join rows having the same:
   - `machine_id`
   - `process_id`

3. Filter the joined rows so that:
   - `a1` represents the `start`
   - `a2` represents the `end`

4. Compute the processing time:

   ```
   end_timestamp - start_timestamp
   ```

5. Group the results by `machine_id`.

6. Calculate the average processing time using `AVG()`.

7. Round the result to 3 decimal places using `ROUND()`.

---

## 🧠 Key Concepts Learned

- Self Join
- Table Aliases
- Multiple Join Conditions (`AND`)
- Aggregate Function (`AVG`)
- `GROUP BY`
- Arithmetic Operations in SQL
- `ROUND()`

---

## 🔍 SQL Query

```sql
SELECT
    a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'start'
AND a2.activity_type = 'end'
GROUP BY a1.machine_id;
```

---

## ⏱️ Complexity

- **Time:** O(n²) (conceptually, though databases optimize joins using indexes)
- **Space:** O(1) (excluding database execution overhead)

---

## ✅ What I Learned

- A **Self Join** can combine related rows from the same table into a single logical record.
- Multiple columns can be used in a join condition to accurately match related data.
- `GROUP BY` divides data into groups before applying aggregate functions like `AVG()`.
- SQL allows arithmetic operations directly on numeric columns.
- `ROUND()` formats numerical results to the required precision.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Transform rows into a logical record → Compute a derived value → Aggregate the result.**

This pattern frequently appears in problems involving:

- Employee clock-in / clock-out records
- User login / logout sessions
- Ride start / end events
- Order placed / delivered timestamps
- Event duration calculations
```
