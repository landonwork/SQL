CREATE DATABASE IF NOT EXISTS creatures;

CREATE TABLE creatures.sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10)
);

DROP TABLE creatures.customers;
CREATE TABLE creatures.customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE creatures.customers
	ADD COLUMN gender ENUM('M','F') AFTER last_name;
INSERT INTO creatures.customers (first_name, last_name, gender, email_address, number_of_complaints)
	VALUES('John','McKinley','M','john.mckinley@365careers.com',0);
    
ALTER TABLE creatures.customers
	CHANGE COLUMN number_of_complaints number_complaints INT DEFAULT 0;
INSERT INTO creatures.customers (first_name, last_name, gender)
	VALUES('Peter','Figaro','M');
SELECT * FROM creatures.customers;

ALTER TABLE creatures.sales
	ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE;
ALTER TABLE creatures.sales
	DROP FOREIGN KEY sales_ibfk_1;
    
ALTER TABLE creatures.customers
	ADD UNIQUE KEY (email_address);
ALTER TABLE creatures.customers
	DROP INDEX email_address;