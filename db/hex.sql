DROP TABLE publishers
DROP TABLE books




CREATE TABLE books
(
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  author VARCHAR(255),
  description TEXT,
  stock_quantity INT2,
  buying_cost INT2,
  selling_price INT2
  publisher_id INT8 REFERENCES publishers(id)
);



CREATE TABLE publishers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  contact_details VARCHAR(255), 
  book_id INT8 REFERENCES books(id)
);
