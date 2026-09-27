-- 1. Insertar Departamentos
INSERT INTO departments (department_id, department_name, manager_id) VALUES
(1, 'Consulting', 1),
(2, 'Software Development', 2),
(3, 'IT Support', 4),
(4, 'Data Analytics', 3);

-- 2. Insertar Servicios
INSERT INTO services (service_id, service_name, category) VALUES
(1, 'Cloud Migration', 'Infrastructure'),
(2, 'Custom CRM Development', 'Software'),
(3, '24/7 Server Monitoring', 'Support'),
(4, 'Data Warehouse Setup', 'Data');

-- 3. Insertar Clientes (Nuestra cartera B2B)
INSERT INTO customers (customer_id, company_name, industry, country, client_tier) VALUES
(1, 'Alpha Logistics', 'Logistics', 'Spain', 'Strategic'),
(2, 'Beta Pharma', 'Healthcare', 'Germany', 'Strategic'),
(3, 'Gamma Retail', 'Retail', 'UK', 'Standard'),
(4, 'Delta Manufacturing', 'Manufacturing', 'Spain', 'Basic'),
(5, 'Epsilon Finance', 'Finance', 'France', 'Standard');

-- 4. Insertar Empleados (Con costes por hora variados)
INSERT INTO employees (employee_id, department_id, first_name, last_name, role, hourly_cost) VALUES
(1, 1, 'Laura', 'Gomez', 'Senior Consultant', 85.00),
(2, 2, 'David', 'Smith', 'Lead Developer', 95.00),
(3, 4, 'Elena', 'Ruiz', 'Data Engineer', 80.00),
(4, 3, 'Carlos', 'Lopez', 'Support Manager', 60.00),
(5, 2, 'Anna', 'Ivanova', 'Backend Developer', 70.00),
(6, 2, 'Marc', 'Vidal', 'Frontend Developer', 65.00),
(7, 3, 'John', 'Doe', 'Support Technician', 40.00),
(8, 1, 'Sara', 'Martin', 'Junior Consultant', 45.00);

-- 5. Insertar Proyectos (Atención a las budgeted_hours)
INSERT INTO projects (project_id, customer_id, service_id, project_name, status, start_date, end_date, budgeted_hours) VALUES
(1, 1, 1, 'Alpha Cloud Move', 'Completed', '2025-01-10', '2025-03-15', 300),
(2, 2, 2, 'Pharma CRM v2', 'Completed', '2025-02-01', '2025-06-30', 500),
(3, 3, 4, 'Retail Data Hub', 'Active', '2025-05-15', NULL, 250),
(4, 4, 3, 'Factory IT Support 2025', 'Active', '2025-01-01', '2025-12-31', 800),
(5, 5, 2, 'Finance Portal', 'Active', '2025-08-01', NULL, 400);

-- 6. Insertar Facturas (Ingresos de los proyectos)
INSERT INTO invoices (invoice_id, project_id, issue_date, due_date, amount_billed) VALUES
(1, 1, '2025-03-20', '2025-04-20', 45000.00),
(2, 2, '2025-07-01', '2025-07-31', 60000.00),
(3, 3, '2025-06-01', '2025-06-30', 25000.00), 
(4, 4, '2025-06-30', '2025-07-30', 30000.00);

-- 7. Insertar Pagos (Control de liquidez)
INSERT INTO payments (payment_id, invoice_id, payment_date, amount_paid) VALUES
(1, 1, '2025-04-15', 45000.00),
(2, 2, '2025-08-10', 60000.00),
(3, 3, '2025-06-25', 25000.00);

-- 8. Insertar Satisfacción del Cliente (CSAT)
INSERT INTO customer_satisfaction (survey_id, customer_id, survey_date, csat_score) VALUES
(1, 1, '2025-03-25', 9),
(2, 2, '2025-07-05', 4), -- Beta Pharma está descontento
(3, 3, '2025-08-01', 8),
(4, 4, '2025-07-15', 7);

-- 9. Insertar Horas Trabajadas (Horas acumuladas a final de mes)
INSERT INTO employee_hours (timesheet_id, employee_id, project_id, work_date, hours_logged) VALUES
(1, 1, 1, '2025-01-31', 100), 
(2, 8, 1, '2025-02-28', 100),
(3, 2, 2, '2025-03-31', 300),
(4, 5, 2, '2025-04-30', 400),
(5, 6, 2, '2025-05-31', 200),
(6, 3, 3, '2025-06-30', 150),
(7, 7, 4, '2025-03-31', 250);

-- 10. Insertar Tickets de Incidencias
INSERT INTO tickets (ticket_id, customer_id, project_id, reported_date, priority, status) VALUES
(1, 2, 2, '2025-06-10', 'Critical', 'Resolved'),
(2, 2, 2, '2025-06-15', 'High', 'Resolved'),
(3, 4, 4, '2025-08-01', 'Medium', 'Open');

-- 11. Insertar Resolución de Tickets
INSERT INTO ticket_resolution (resolution_id, ticket_id, resolved_by, resolution_date) VALUES
(1, 1, 2, '2025-06-25'),
(2, 2, 5, '2025-06-20');