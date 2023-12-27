CREATE TABLE AddressType (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Address (
    id int NOT NULL AUTO_INCREMENT,
    street varchar(255) NOT NULL,
    city varchar(255) NOT NULL,
    state varchar(255) NOT NULL,
    zip varchar(255) NOT NULL,
    type int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (type) REFERENCES AddressType(id)
);

CREATE TABLE JobType (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE JobStatus (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Customer (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Engineer (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Job (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    date datetime NULL,
    duration int NULL,
    PRIMARY KEY (id)
);

CREATE TABLE JobJobStatus (
    id int NOT NULL AUTO_INCREMENT,
    job_id int NOT NULL,
    job_status_id int NOT NULL,
    date datetime NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES Job(id),
    FOREIGN KEY (job_status_id) REFERENCES JobStatus(id),
    UNIQUE KEY (job_id, job_status_id, date)
);

CREATE TABLE JobJobType (
    id int NOT NULL AUTO_INCREMENT,
    job_id int NOT NULL,
    job_type_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES Job(id),
    FOREIGN KEY (job_type_id) REFERENCES JobType(id),
    UNIQUE KEY (job_id, job_type_id)
);

CREATE TABLE EngineerJob (
    id int NOT NULL AUTO_INCREMENT,
    engineer_id int NOT NULL,
    job_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (engineer_id) REFERENCES Engineer(id),
    FOREIGN KEY (job_id) REFERENCES Job(id),
    UNIQUE KEY (engineer_id, job_id)
);

CREATE TABLE JobAddress (
    id int NOT NULL AUTO_INCREMENT,
    job_id int NOT NULL,
    address_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES Job(id),
    FOREIGN KEY (address_id) REFERENCES Address(id),
    UNIQUE KEY (job_id, address_id)
);

CREATE TABLE EngineerAddress (
    id int NOT NULL AUTO_INCREMENT,
    engineer_id int NOT NULL,
    address_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (engineer_id) REFERENCES Engineer(id),
    FOREIGN KEY (address_id) REFERENCES Address(id),
    UNIQUE KEY (engineer_id, address_id)
);

CREATE TABLE CustomerAddress (
    id int NOT NULL AUTO_INCREMENT,
    customer_id int NOT NULL,
    address_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (address_id) REFERENCES Address(id),
    UNIQUE KEY (customer_id, address_id)
);