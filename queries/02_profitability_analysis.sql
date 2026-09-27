SELECT 
    p.project_name,
    c.company_name,
    SUM(eh.hours_logged) AS actual_hours_spent,
    SUM(eh.hours_logged * e.hourly_cost) AS total_labor_cost
FROM projects p
INNER JOIN customers c ON p.customer_id = c.customer_id
INNER JOIN employee_hours eh ON p.project_id = eh.project_id
INNER JOIN employees e ON eh.employee_id = e.employee_id
GROUP BY p.project_name, c.company_name
ORDER BY total_labor_cost DESC;


SELECT 
    p.project_name,
    c.company_name,
    i.amount_billed AS revenue,
    SUM(eh.hours_logged * e.hourly_cost) AS total_cost,
    i.amount_billed - SUM(eh.hours_logged * e.hourly_cost) AS net_profit
FROM projects p
INNER JOIN customers c ON p.customer_id = c.customer_id
INNER JOIN invoices i ON p.project_id = i.project_id
INNER JOIN employee_hours eh ON p.project_id = eh.project_id
INNER JOIN employees e ON eh.employee_id = e.employee_id
GROUP BY p.project_name, c.company_name, i.amount_billed
ORDER BY net_profit ASC;