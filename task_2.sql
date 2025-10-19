-- task_2.sql
-- Create all tables for alx_book_store database

-- 1. Authors Table
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. Customers Table
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- 3. Books Table (references AUTHORS)
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    CONSTRAINT FK_AUTHOR FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- 4. Orders Table (references CUSTOMERS)
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    CONSTRAINT FK_CUSTOMER FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- 5. Order_Details Table (references ORDERS and BOOKS)
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    CONSTRAINT FK_ORDER FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    CONSTRAINT FK_BOOK FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

