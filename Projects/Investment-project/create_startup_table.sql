CREATE TABLE startup (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20),
  description text,
  founded_date VARCHAR(40),
  category_list text,
  total_funding_amout DOUBLE,
  PRIMARY KEY (id)
);