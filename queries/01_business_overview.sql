SELECT 
    company_name, 
    industry, 
    client_tier 
FROM customers 
WHERE client_tier IN ('Strategic', 'Standard')
ORDER BY client_tier DESC, company_name ASC;

SELECT 
    status, 
    COUNT(project_id) AS total_projects, 
    SUM(budgeted_hours) AS total_budgeted_hours
FROM projects 
GROUP BY status
ORDER BY total_budgeted_hours DESC;