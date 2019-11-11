DROP TABLE books;
DROP TABLE publishers;




CREATE TABLE publishers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  contact_details VARCHAR(255)
);



CREATE TABLE books
(
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  author VARCHAR(255),
  description TEXT,
  stock_quantity INT2,
  buying_cost FLOAT,
  selling_price FLOAT,
  publisher_id INT8 REFERENCES publishers(id)
);
