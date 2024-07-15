CREATE EXTENSION timescaledb;

CREATE TABLE external_links
(
  id varchar(255) NOT NULL PRIMARY KEY,
  name varchar(255) NOT NULL,
  url varchar(255) NOT NULL
);

CREATE TABLE news
(
  id varchar(255) NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  published timestamp NOT NULL,
  source varchar(255) NOT NULL,
  external_link_id varchar(255) NOT NULL REFERENCES external_links (id)
);

CREATE TABLE news_soc_codes
(
  news_id varchar(255) NOT NULL REFERENCES news (id),
  soc char(7) NOT NULL
);

CREATE TABLE certifications
(
  id varchar(255) NOT NULL PRIMARY KEY,
  title varchar(255),
  description text,
  source varchar(255)
);

CREATE TABLE certifications_soc_codes
(
  certification_id varchar(255) NOT NULL REFERENCES certifications (id),
  soc char(7) NOT NULL
);

CREATE TABLE certifications_external_links
(
  certification_id varchar(255) NOT NULL REFERENCES certifications (id),
  external_link_id varchar(255) NOT NULL REFERENCES external_links (id)
);

CREATE TABLE learning_material
(
  id varchar(255) NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  source varchar(255),
  type varchar(255)
);

CREATE TABLE learning_material_soc_codes
(
  learning_material_id varchar(255) NOT NULL REFERENCES learning_material (id),
  soc char(7) NOT NULL
);

CREATE TABLE learning_material_external_links
(
  learning_material_id varchar(255) NOT NULL REFERENCES learning_material (id),
  external_link_id varchar(255) NOT NULL REFERENCES external_links (id)
);

CREATE TABLE unemployment
(
  id varchar(255) NOT NULL PRIMARY KEY,
  soc char(7) NOT NULL,
  date date NOT NULL,
  value decimal
);

CREATE TABLE profile
(
  id varchar(255) NOT NULL PRIMARY KEY,
  name varchar(255),
  email varchar(255),
  postal_code varchar(255),
  current_soc char(7),
  goal_soc char(7),
  tos_consent boolean
);

CREATE TABLE click_data
(
  timestamp timestamp NOT NULL,
  element_id varchar(255) NOT NULL,
  element_type varchar(255) NOT NULL,
  user_id varchar(255),
  user_postal_code varchar(255),
  user_current_soc char(7),
  user_goal_soc char(7)
);

SELECT create_hypertable('click_data', 'timestamp');