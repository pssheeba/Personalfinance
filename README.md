# Personalfinance

# **💰 Personal Finance Tracker - SQL Database Project**

## **📌 Project Overview**
A SQL-based personal finance management system that helps track income, expenses, accounts, and budgets. Built with **SQL Server Management Studio (SSMS)**, this project demonstrates practical database design for financial tracking.

## **✨ Key Features**
- **Account Management** (Checking, Savings, Credit Cards)
- **Transaction Tracking** (Income & Expenses)
- **Category System** (Customizable expense/income categories)
- **Budget Planning** (Monthly budget goals)
- **Financial Reports** (Spending analysis, budget vs actuals)

## **🛠️ Technologies Used**
- **Database**: Microsoft SQL Server
- **Tool**: SQL Server Management Studio (SSMS)
- **Query Language**: T-SQL

## **🗄️ Database Schema**
### **Core Tables**
1. **`Accounts`** - Bank/Credit accounts
2. **`Categories`** - Income/Expense classifications
3. **`Transactions`** - Financial records
4. **`Budgets`** - Monthly spending limits

### **ER Diagram**
```
[Accounts] 1---∞ [Transactions]
               ↑
[Categories] 1---∞
[Budgets] ----1 [Categories]
```

## **🚀 Getting Started**
### **1. Database Setup**
```sql
CREATE DATABASE PersonalFinance;
USE PersonalFinance;
```

### **2. Table Creation**
Run the schema from [schema.sql](schema.sql):
```sql
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    AccountName VARCHAR(100) NOT NULL,
    AccountType VARCHAR(50),
    Balance DECIMAL(10,2) DEFAULT 0.00
);
-- Additional tables in schema file
```

### **3. Sample Data**
```sql
INSERT INTO Categories VALUES 
('Salary', 'Income'),
('Rent', 'Expense'),
('Groceries', 'Expense');
```

## **📊 Example Queries**
### **Monthly Expense Report**
```sql
SELECT c.CategoryName, SUM(t.Amount) AS Spent, b.Amount AS Budget
FROM Transactions t
JOIN Categories c ON t.CategoryID = c.CategoryID
LEFT JOIN Budgets b ON t.CategoryID = b.CategoryID
WHERE c.CategoryType = 'Expense'
GROUP BY c.CategoryName, b.Amount;
```

### **Account Balance Summary**
```sql
SELECT 
    AccountName,
    SUM(CASE WHEN Amount > 0 THEN Amount ELSE 0 END) AS TotalIncome,
    SUM(CASE WHEN Amount < 0 THEN Amount ELSE 0 END) AS TotalExpenses
FROM Accounts a
JOIN Transactions t ON a.AccountID = t.AccountID
GROUP BY AccountName;
```

## **📈 Advanced Features**
- **Recurring Transactions** (via `IsRecurring` flag)
- **Budget Tracking** (Monthly comparisons)
- **Year-over-Year Analysis**

## **📂 File Structure**
```
📁 Personal-Finance-SQL/
├── schema.sql        # Database structure
├── sample_data.sql   # Test data
├── queries.sql       # Useful queries
└── reports.sql       # Financial analysis
```

## **📜 License**
MIT License - Free for personal and commercial use

## **📬 Contact & Contribution**
Found a bug or have suggestions?  
📧 Email: [pauline.sheeba94@gmail.com](mailto:pauline.sheeba94@gmail.com)  
💻 GitHub: [Pssheeba](https://github.com/pssheeba)

**⭐ Star this repo if you find it useful!**
