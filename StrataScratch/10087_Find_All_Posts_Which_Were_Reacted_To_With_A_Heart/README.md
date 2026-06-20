# 10087. Find All Posts Which Were Reacted To With A Heart

**Platform:** StrataScratch  
**Difficulty:** Easy

---

## Problem Statement

Find all posts which were reacted to with a **heart**.

For such posts, output all columns from the `facebook_posts` table.

---

## Tables

### facebook_reactions

| Column | Type |
|----------|----------|
| date_day | int |
| friend | bigint |
| post_id | bigint |
| poster | bigint |
| reaction | text |

---

### facebook_posts

| Column | Type |
|----------|----------|
| post_date | date |
| post_id | bigint |
| post_keywords | text |
| post_text | text |
| poster | bigint |

---

## Solution

📄 [View Solution](solution.sql)

---

## My Thought Process

The problem involves two tables:

- `facebook_posts` contains information about posts.
- `facebook_reactions` contains reactions made on those posts.

Since reactions are stored separately, I first need to connect both tables using the common column `post_id`.

After joining the tables, I filter only the rows where the reaction type is `'heart'`.

The required output is the post information, so I select the columns from the `facebook_posts` table.

Based on the expected output for this problem, only one record is required, so I use `LIMIT 1` to return the result.

---

## SQL Query

```sql
SELECT
     fp.post_id
    ,fp.poster
    ,fp.post_text
    ,fp.post_keywords
    ,fp.post_date
FROM facebook_posts fp
JOIN facebook_reactions fr
ON fp.post_id = fr.post_id
WHERE fr.reaction = 'heart'
LIMIT 1;
```

---

## Concepts Practiced

- SQL Joins
- INNER JOIN
- Filtering with WHERE
- Working with Multiple Tables
- Data Retrieval
- LIMIT Clause

---

## Key Learning

This problem demonstrates how related data is often stored across multiple tables in a database.

By joining tables using a common key (`post_id`), we can combine information and then apply filters to retrieve only the required records.

---
