-- Create the users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

-- Insert 10 sample users
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
INSERT INTO users (name, email) VALUES ('Jane Smith', 'jane@example.com');
INSERT INTO users (name, email) VALUES ('Alice Johnson', 'alice.johnson@example.com');
INSERT INTO users (name, email) VALUES ('Bob Brown', 'bob.brown@example.com');
INSERT INTO users (name, email) VALUES ('Charlie Davis', 'charlie.davis@example.com');
INSERT INTO users (name, email) VALUES ('Diana Moore', 'diana.moore@example.com');
INSERT INTO users (name, email) VALUES ('Ethan Clark', 'ethan.clark@example.com');
INSERT INTO users (name, email) VALUES ('Fiona Adams', 'fiona.adams@example.com');
INSERT INTO users (name, email) VALUES ('George Wright', 'george.wright@example.com');
INSERT INTO users (name, email) VALUES ('Hannah Baker', 'hannah.baker@example.com');
