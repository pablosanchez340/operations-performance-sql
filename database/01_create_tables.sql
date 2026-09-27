-- 1. LIMPIEZA FORZOSA (Idempotencia)
DROP TABLE IF EXISTS ticket_resolution;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS employee_hours;
DROP TABLE IF EXISTS customer_satisfaction;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS customers;

-- 2. CREACIÓN DE TABLAS (Dimensiones)
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    manager_id INTEGER
);

CREATE TABLE services (
    service_id INTEGER PRIMARY KEY,
    service_name VARCHAR(150) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL UNIQUE,
    industry VARCHAR(100),
    country VARCHAR(100),
    client_tier VARCHAR(50) CHECK (client_tier IN ('Strategic', 'Standard', 'Basic'))
);

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    department_id INTEGER NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    hourly_cost NUMERIC(10, 2) CHECK (hourly_cost >= 0),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 3. CREACIÓN DE TABLAS (Hechos Operativos)
CREATE TABLE projects (
    project_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    project_name VARCHAR(200) NOT NULL,
    status VARCHAR(50) DEFAULT 'Planned' CHECK (status IN ('Planned', 'Active', 'On Hold', 'Completed')),
    start_date DATE NOT NULL,
    end_date DATE,
    budgeted_hours INTEGER CHECK (budgeted_hours > 0),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE employee_hours (
    timesheet_id INTEGER PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    work_date DATE NOT NULL,
    hours_logged NUMERIC(5, 2) CHECK (hours_logged > 0),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE tickets (
    ticket_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    reported_date DATE NOT NULL,
    priority VARCHAR(50) CHECK (priority IN ('Low', 'Medium', 'High', 'Critical')),
    status VARCHAR(50) DEFAULT 'Open' CHECK (status IN ('Open', 'In Progress', 'Resolved', 'Closed')),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE ticket_resolution (
    resolution_id INTEGER PRIMARY KEY,
    ticket_id INTEGER NOT NULL UNIQUE,
    resolved_by INTEGER NOT NULL,
    resolution_date DATE NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),
    FOREIGN KEY (resolved_by) REFERENCES employees(employee_id)
);

CREATE TABLE customer_satisfaction (
    survey_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    survey_date DATE NOT NULL,
    csat_score INTEGER CHECK (csat_score >= 1 AND csat_score <= 10),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE invoices (
    invoice_id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE,
    amount_billed NUMERIC(12, 2) CHECK (amount_billed >= 0),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    invoice_id INTEGER NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid NUMERIC(12, 2) CHECK (amount_paid >= 0),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);