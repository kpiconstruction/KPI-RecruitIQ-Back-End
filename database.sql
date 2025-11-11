
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE role_permissions (
    role_id INT,
    permission_id INT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(id),
    FOREIGN KEY (permission_id) REFERENCES permissions(id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    entity_id INT,
    FOREIGN KEY (entity_id) REFERENCES entities(id)
);

CREATE TABLE applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    applicant_name VARCHAR(100),
    applicant_email VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES jobs(id)
);

CREATE TABLE hold_points (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE application_flows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    hold_point_id INT,
    status VARCHAR(50),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(id),
    FOREIGN KEY (hold_point_id) REFERENCES hold_points(id)
);

CREATE TABLE documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    file_path VARCHAR(255),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES applications(id)
);

CREATE TABLE tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    ticket_number VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (application_id) REFERENCES applications(id)
);

CREATE TABLE licences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    licence_type VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    FOREIGN KEY (application_id) REFERENCES applications(id)
);

CREATE TABLE inductions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    induction_type VARCHAR(100),
    completed_date DATE,
    FOREIGN KEY (application_id) REFERENCES applications(id)
);

CREATE TABLE social_procurement_tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE application_tags (
    application_id INT,
    tag_id INT,
    PRIMARY KEY (application_id, tag_id),
    FOREIGN KEY (application_id) REFERENCES applications(id),
    FOREIGN KEY (tag_id) REFERENCES social_procurement_tags(id)
);

CREATE TABLE onboarding_steps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    step_name VARCHAR(100),
    completed BOOLEAN DEFAULT FALSE,
    completed_at TIMESTAMP NULL,
    FOREIGN KEY (application_id) REFERENCES applications(id)
);
