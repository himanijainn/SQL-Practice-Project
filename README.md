# 📚 SQL Learning Series – Company Database (MySQL)

This repository contains a fully designed and expanded **MySQL practice database** called `company_db`.  
It includes **8 relational tables**, over **150+ rows** of sample data, and **multiple SQL practice topics**, including:

- SQL JOINS  
- GROUP BY & Aggregations  
- Subqueries  
- Views  
- Set Operations  
- Attendance Analysis  
- Vendor & Finance Analysis  
- Stored Procedure
- Common Table Expressions
- Triggers
---

# 🏢 Database Overview

The `company_db` database models a mid-size corporate environment with:

### **Main Entities**
| Table | Description |
|-------|-------------|
| `departments` | List of all departments in the company |
| `employees` | Employee details and department mapping |
| `projects` | Projects owned by departments |
| `employee_projects` | Employee ↔ Project assignments (many-to-many) |
| `salaries` | Salary details for all employees |
| `bonuses` | Bonus records |
| `attendance` | Daily attendance logs |
| `vendors` | External vendors supplying services |
| `vendor_payments` | Payments made to vendors |

---

# 🔗 ER Diagram

<img width="1920" height="1080" alt="Screenshot 2025-11-18 184111" src="https://github.com/user-attachments/assets/fc5c0820-88ee-48d6-89e0-5c5c4e3e0836" />


The ER Diagram shows all table relationships, including:

- One-to-Many  
- Many-to-Many  
- Self-Join (manager relationship)  
- Finance & Vendor relationships  

Add the exported diagram here:

