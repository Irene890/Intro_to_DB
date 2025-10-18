-- USE alx_book_store;

-- CREATE TABLE AUTHORS (
--     author_id INT PRIMARY KEY,
--     author_name VARCHAR(215) NOT NULL
-- );
-- CREATE TABLE BOOKS (
--     book_id INT PRIMARY KEY,
--     title VARCHAR(130) NOT NULL,
--     author_id INT,
--     price DOUBLE NOT NULL,
--     publication_date DATE,
--     FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
-- );
-- CREATE TABLE CUSTOMERS (
--     customer_id INT PRIMARY KEY,
--     customer_name VARCHAR(215) NOT NULL,
--     email VARCHAR(215) NOT NULL UNIQUE,
--     address TEXT
-- );
-- CREATE TABLE ORDERS (
--     order_id INT PRIMARY KEY,
--     customer_id INT,
--     order_date DATE NOT NULL,
--     FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
-- );
-- CREATE TABLE ORDER_DETAILS (
--     orderdetailid INT PRIMARY KEY,
--     order_id INT,
--     book_id INT,
--     quantity DOUBLE NOT NULL,
--     FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
--     FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
-- );


USE alx_book_store;

CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);