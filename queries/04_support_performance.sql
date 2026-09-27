WITH ResolutionTimes AS (
    SELECT 
        c.company_name,
        t.priority,
        t.reported_date,
        tr.resolution_date,
        CAST(JULIANDAY(tr.resolution_date) - JULIANDAY(t.reported_date) AS INTEGER) AS days_to_resolve
    FROM tickets t
    INNER JOIN ticket_resolution tr ON t.ticket_id = tr.ticket_id
    INNER JOIN customers c ON t.customer_id = c.customer_id
)
SELECT 
    company_name,
    priority,
    days_to_resolve
FROM ResolutionTimes
ORDER BY days_to_resolve DESC;