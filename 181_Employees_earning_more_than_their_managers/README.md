# Employees Earning More Than Their Managers

## Problem Description
Find all employees who earn strictly more than their managers. A manager is defined by the `managerId` column, which references the `id` of another employee in the same table.

## Database Schema

### Employee Table

| Column Name | Type | Description |
| :--- | :--- | :--- |
| `id` | int | Primary Key |
| `name` | varchar | Employee Name |
| `salary` | int | Employee Salary |
| `managerId` | int | Foreign Key referencing `id` (Nullable) |

---

## Optimized SQL Solution

This solution uses an **Inner Join** (Self-Join) to pair each employee with their direct manager in a single row.

```sql
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2
  ON e1.managerId = e2.id
  AND e1.salary > e2.salary;
```

---

## Explanation of Logic

1. **Self-Join (`FROM Employee e1 JOIN Employee e2`)**: We treat the `Employee` table as two distinct entities: `e1` acts as the employee list, and `e2` acts as the manager list.
2. **Join Condition (`ON e1.managerId = e2.id`)**: This matches each employee record with their exact manager's record. Employees without a manager (`managerId IS NULL`) are automatically excluded by this inner join.
3. **Filter Condition (`AND e1.salary > e2.salary`)**: This acts as a filter directly during the join process, only keeping rows where the employee's salary is greater than their matched manager's salary.

---

## Example Walkthrough

### Input Table: `Employee`

| id | name | salary | managerId |
| :--- | :--- | :--- | :--- |
| 1 | Joe | 70000 | 3 |
| 2 | Henry | 80000 | 4 |
| 3 | Sam | 60000 | Null |
| 4 | Max | 90000 | Null |

### Intermediate Joined State

| e1.name (Employee) | e1.salary | e2.name (Manager) | e2.salary | `e1.salary > e2.salary` |
| :--- | :--- | :--- | :--- | :--- |
| Joe | 70,000 | Sam | 60,000 | **True** (Keep) |
| Henry | 80,000 | Max | 90,000 | **False** (Discard) |

### Output Table

| Employee |
| :--- |
| Joe |

---

## Performance Considerations
* **Indexing**: To scale this query for large datasets, an index should be placed on `managerId` and `id` to optimize the join operation.
* **Filter Efficiency**: Combining the salary evaluation directly inside the `ON` clause is generally well-optimized by modern SQL query planners, identical to placing it in a `WHERE` clause.
