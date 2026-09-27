SELECT 
    c.company_name,
    p.project_name,
    cs.csat_score,
    COUNT(t.ticket_id) AS total_issues
FROM customers c
INNER JOIN projects p ON c.customer_id = p.customer_id
LEFT JOIN customer_satisfaction cs ON c.customer_id = cs.customer_id
LEFT JOIN tickets t ON p.project_id = t.project_id
GROUP BY c.company_name, p.project_name, cs.csat_score
ORDER BY cs.csat_score ASC;