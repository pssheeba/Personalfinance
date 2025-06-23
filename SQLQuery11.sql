-- Monthly expense report
SELECT c.CategoryName, SUM(t.Amount) AS TotalAmount, b.Amount AS BudgetAmount
FROM Transactions t
JOIN Categories c ON t.CategoryID = c.CategoryID
LEFT JOIN Budgets b ON t.CategoryID = b.CategoryID AND b.MonthYear = '2023-05'
WHERE c.CategoryType = 'Expense' AND MONTH(t.TransactionDate) = 5 AND YEAR(t.TransactionDate) = 2023
GROUP BY c.CategoryName, b.Amount;

-- Account balance history
SELECT a.AccountName, 
       SUM(CASE WHEN t.Amount > 0 THEN t.Amount ELSE 0 END) AS TotalIncome,
       SUM(CASE WHEN t.Amount < 0 THEN t.Amount ELSE 0 END) AS TotalExpenses,
       a.Balance AS CurrentBalance
FROM Accounts a
LEFT JOIN Transactions t ON a.AccountID = t.AccountID
GROUP BY a.AccountName, a.Balance;