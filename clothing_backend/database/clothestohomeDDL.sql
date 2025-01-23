-- Table structure for owner

DROP TABLE IF EXISTS owner;
CREATE TABLE owner (
  owner_id UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
  f_name VARCHAR(50) NOT NULL,
  l_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password TEXT NOT NULL
);
-- TODO: AMEND DB TO INCLUDE PASSWORD

-- Sample owner table insertion

-- LOCK TABLE owner IN EXCLUSIVE MODE;
-- INSERT INTO owner (f_name, l_name, email, password)
-- VALUES ('Stephen', 'Gallivan', 'sgallivan13@gmail.com', 'stephenpassword!');
-- INSERT INTO owner (f_name, l_name, email, password)
-- VALUES ('Cheyenne', 'Gallivan', 'cheyenne.schoen@gmail.com@gmail.com', 'cheyennepassword!');
-- INSERT INTO owner (f_name, l_name, email, password)
-- VALUES ('Andrew', 'Gallivan', 'andrewt.gallivan@gmail.com', 'andrewpassword!')
-- UNLOCK TABLE;



-- Table structure for location

DROP TABLE IF EXISTS location;
CREATE TABLE location (
  location_id UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL,
  street_address VARCHAR(255),
  apartment_number VARCHAR(50),
  city VARCHAR(100),
  state VARCHAR(100),
  postal_code VARCHAR(20),
  country VARCHAR(100)
);

-- Sample location table insertion

-- LOCK TABLE location IN EXCLUSIVE MODE;
-- INSERT INTO location (nickname, street_address, apartment_number, city, state, postal_code, country)
-- VALUES ('Home', '1009 S Trenton Ave', 'Apt 2', 'Pittsburgh', 'Pennsylvania', '15221', 'USA');
-- INSERT INTO location (nickname, street_address, apartment_number, city, state, postal_code, country)
-- VALUES ('Grammy's House', '225 Laurel St.', '', 'Rehoboth Beach', 'Delaware', '19971', 'USA');
-- INSERT INTO location (nickname, street_address, apartment_number, city, state, postal_code, country)
-- VALUES ('Mom & Dad's', '146 Canon Dr.', '', 'Santa Barbara', 'California', '93105', 'USA');
-- INSERT INTO location (nickname, street_address, apartment_number, city, state, postal_code, country)
-- VALUES ('Schoen Cabin', '40 Clark Point Rd.', '', 'Bernard', 'Maine', '04612', 'USA');
-- UNLOCK TABLE;



-- Table structure for clothing

DROP TABLE IF EXISTS clothing;
CREATE TABLE clothing (
  clothing_id UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
  clothing_name VARCHAR(100) NOT NULL,
  clothing_category VARCHAR(20) NOT NULL,
  clothing_condition VARCHAR(15),
  clothing_description VARCHAR(255),
  clothing_photo VARCHAR(255),
  clothing_brand VARCHAR(50),
  location_id UUID NOT NULL REFERENCES location(location_id) ON DELETE CASCADE,
  owner_id UUID NOT NULL REFERENCES owner(owner_id) ON DELETE CASCADE
);

-- Changed "item" to clothing

-- Sample clothing table insertion

-- LOCK TABLE clothing IN EXCLUSIVE MODE;
-- INSERT INTO clothing (clothing_name, clothing_category, clothing_condition, clothing_description, clothing_photo, clothing_brand, location_id, owner_id)
-- VALUES ('Green Jacket', 'Outerwear', 'Good', 'Green jacket with hood and many pockets', 'jacket-photo-url.jpg', 'Columbia', 'location-uuid', 'owner-uuid');
-- VALUES ('Brown Shacket', 'Outerwear', 'Good', 'Fuzzy brown shacket with click buttons and two pockets', 'shacket-photo-url.jpg', 'Toad & Co', 'location-uuid', 'owner-uuid');
-- VALUES ('Hiking Boots', 'Shoes', 'Good', 'Small hole on little toe of one boot', 'boots-photo-url.jpg', 'Columbia', 'location-uuid', 'owner-uuid');
-- VALUES ('Hoka Trail Running Shoes', 'Shoes', 'Good', 'Pink and purple', 'hoka-photo-url.jpg', 'Hoka', 'location-uuid', 'owner-uuid');
-- UNLOCK TABLE;

INSERT INTO clothing (item_name, item_category, item_condition, item_description, item_photo, item_brand, location_id, owner_id)
VALUES ('Hiking Boots', 'Shoes', 'Good', 'Small hole on little toe of one boot', 'photo-url.jpg', 'Columbia', '573c6cf8-cded-411f-8ae7-134967fcfdf8', '78c96b8f-bc81-4b76-9a32-0fd3354b28d9');