-- Create the employees table
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,  -- Unique ID for each employee
  first_name VARCHAR(100),          -- Employee's first name
  last_name VARCHAR(100),           -- Employee's last name
  department VARCHAR(100),          -- Department where the employee works
  job_title VARCHAR(100),           -- Employee's job title
  email VARCHAR(100),               -- Employee's email address
  phone_number VARCHAR(15),         -- Employee's contact number
  hire_date DATE,                   -- Date the employee was hired
  status VARCHAR(20)                -- Current employment status
);

-- Insert 10 sample employees
INSERT INTO employees (first_name, last_name, department, job_title, email, phone_number, hire_date, status) VALUES
('John', 'Doe', 'Sales', 'Sales Manager', 'john.doe@example.com', '(555) 123-4567', '2020-01-15', 'Active'),
('Jane', 'Smith', 'Marketing', 'Marketing Specialist', 'jane.smith@example.com', '(555) 234-5678', '2021-03-20', 'Active'),
('Alice', 'Johnson', 'IT', 'Software Engineer', 'alice.johnson@example.com', '(555) 345-6789', '2019-07-11', 'Inactive'),
('Bob', 'Brown', 'HR', 'HR Manager', 'bob.brown@example.com', '(555) 456-7890', '2018-11-05', 'Active'),
('Charlie', 'Davis', 'Finance', 'Accountant', 'charlie.davis@example.com', '(555) 567-8901', '2022-02-14', 'Active'),
('Diana', 'Moore', 'Sales', 'Sales Associate', 'diana.moore@example.com', '(555) 678-9012', '2023-05-01', 'Active'),
('Ethan', 'Clark', 'Marketing', 'SEO Specialist', 'ethan.clark@example.com', '(555) 789-0123', '2023-06-10', 'Active'),
('Fiona', 'Adams', 'IT', 'Systems Analyst', 'fiona.adams@example.com', '(555) 890-1234', '2022-09-15', 'Active'),
('George', 'Wright', 'Finance', 'Financial Analyst', 'george.wright@example.com', '(555) 901-2345', '2020-04-22', 'Inactive'),
('Hannah', 'Baker', 'HR', 'Recruiter', 'hannah.baker@example.com', '(555) 012-3456', '2021-08-30', 'Active');
