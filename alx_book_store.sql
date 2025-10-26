-- Create the database
CREATE DATABASE alx_book_store;

-- Use the database
USE alx_book_store;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Optional sample data for testing

-- Insert sample authors
INSERT INTO Authors (author_name)
VALUES ('George Orwell'), ('Jane Austen'), ('J.K. Rowling');

-- Insert sample books
INSERT INTO Books (title, author_id, price, publication_date)
VALUES 
('1984', 1, 12.99, '1949-06-08'),
('Pride and Prejudice', 2, 9.99, '1813-01-28'),
('Harry Potter and the Sorcerer''s Stone', 3, 19.99, '1997-06-26');

-- Insert sample customers
INSERT INTO Customers (customer_name, email, address)
VALUES 
('John Doe', 'john@example.com', '123 Main St'),
('Jane Smith', 'jane@example.com', '456 Elm St');

-- Insert sample orders
INSERT INTO Orders (customer_id, order_date)
VALUES (1, '2025-10-19'), (2, '2025-10-18');

-- Insert sample order details
INSERT INTO Order_Details (order_id, book_id, quantity)
VALUES (1, 1, 2), (1, 3, 1), (2, 2, 1);
