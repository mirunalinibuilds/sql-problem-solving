# 1517. Find Users With Valid E-Mails

## 📌 Problem

Given the `Users` table, find all users whose email addresses are **valid**.

A valid email must satisfy the following rules:

- The prefix (before `@`) must start with a letter.
- The remaining characters in the prefix may contain:
  - Letters (`A-Z`, `a-z`)
  - Digits (`0-9`)
  - Underscore (`_`)
  - Period (`.`)
  - Dash (`-`)
- The email must end with **`@leetcode.com`** (case-sensitive).

Return the result table in any order.

---

## 💡 Approach

The solution combines **Regular Expressions** and **case-sensitive matching**.

### Steps

1. Use `REGEXP` to validate the overall email format.
2. Ensure the first character is a letter.
3. Allow only valid characters in the email prefix.
4. Match the domain `@leetcode.com`.
5. Use `LIKE BINARY` to enforce that the domain is **exactly lowercase**, preventing matches such as `@leetcode.COM`.

---

## 🧠 Key Concepts Learned

- `REGEXP`
- Character Classes (`[]`)
- Anchors (`^` and `$`)
- Quantifiers (`*`)
- Escaping Characters (`\\.`)
- `LIKE BINARY`
- Case-Sensitive String Matching

---

## 🔍 SQL Query

```sql
SELECT user_id, name, mail
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$'
AND mail LIKE BINARY '%@leetcode.com';
```

---

## ⏱️ Complexity

Let:

- **N** = Number of rows in the `Users` table
- **L** = Average length of an email address

- **Time Complexity:** O(N × L)
- **Space Complexity:** O(1)

---

## ✅ What I Learned

- `REGEXP` validates text based on a pattern rather than exact values.
- `^` matches the beginning of a string, while `$` matches the end.
- Character classes (`[]`) define a set of allowed characters.
- `*` allows zero or more occurrences of the preceding character set.
- `\\.` is used to match a literal period (`.`) in a regular expression.
- MySQL's `REGEXP` may perform **case-insensitive matching** depending on the column's collation.
- `LIKE BINARY` forces **case-sensitive** comparison, ensuring the domain matches exactly.

---

## 🎯 Interview Pattern

This problem demonstrates a common SQL interview pattern:

> **Validate text format using Regular Expressions → Apply additional case-sensitive constraints if required.**

This pattern frequently appears in scenarios such as:

- Email validation
- Username validation
- Phone number verification
- Product code validation
- License plate validation
- Password format checking

---

## 🚀 Key Takeaway

When validating strings in SQL:

1. Use `REGEXP` to describe the required text pattern.
2. Use anchors (`^` and `$`) to match the entire string.
3. Define valid characters using character classes.
4. Escape special regex characters when needed.
5. Be aware that `REGEXP` behavior may depend on the database collation.
6. Use `LIKE BINARY` (or another case-sensitive comparison) when an exact character case is required.

Recognizing the **Pattern Match → Case Validation** approach is an essential SQL interview skill.

---

## 🌟 Advanced Notes

### Why wasn't `REGEXP` alone enough?

Although the regular expression specified `@leetcode\\.com`, MySQL's `REGEXP` can be **case-insensitive** depending on the column's collation.

For example, it may incorrectly match:

- `abc@leetcode.COM`
- `abc@LeetCode.com`

To prevent this, the query adds:

```sql
AND mail LIKE BINARY '%@leetcode.com'
```

This ensures that the email domain is matched **exactly**, including letter case.

> **Learning:** Regular expressions define **what** to match, while collation and `BINARY` determine **how** text comparisons are performed.
