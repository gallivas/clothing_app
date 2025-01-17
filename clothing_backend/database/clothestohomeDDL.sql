-- Table structure for owner

DROP TABLE IF EXISTS owner;
CREATE TABLE owner (
  owner_id UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
  f_name VARCHAR(50) NOT NULL,
  l_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);

-- Sample owner table insertion

-- LOCK TABLE owner IN EXCLUSIVE MODE;
-- INSERT INTO owner (f_name, l_name, email)
-- VALUES ('Jane', 'Smith', 'jane.smith@example.com');
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
-- INSERT INTO location (nickname, street_address, apartment_number, city, state_or_region, postal_code, country)
-- VALUES ('Store 1', '456 Elm St', 'Apt 12', 'San Francisco', 'California', '94103', 'USA');
-- UNLOCK TABLE;



-- Table structure for clothing

DROP TABLE IF EXISTS clothing;
CREATE TABLE clothing (
  item_id UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
  item_name VARCHAR(100) NOT NULL,
  item_category VARCHAR(20) NOT NULL,
  item_condition VARCHAR(15),
  item_description VARCHAR(255),
  item_photo VARCHAR(255),
  item_brand VARCHAR(50),
  location_id UUID NOT NULL REFERENCES location(location_id) ON DELETE CASCADE,
  owner_id UUID NOT NULL REFERENCES owner(owner_id) ON DELETE CASCADE
);

-- Sample clothing table insertion

-- LOCK TABLE clothing IN EXCLUSIVE MODE;
-- INSERT INTO clothing (item_name, item_category, item_condition, item_description, item_photo, item_brand, location_id, owner_id)
-- VALUES ('T-Shirt', 'Apparel', 'Used', 'A comfortable cotton T-shirt', 'photo-url', 'BrandX', 'location-uuid', 'owner-uuid');
-- UNLOCK TABLE;

INSERT INTO clothing (item_name, item_category, item_condition, item_description, item_photo, item_brand, location_id, owner_id)
VALUES ('Hiking Boots', 'Shoes', 'Good', 'Small hole on little toe of one boot', 'photo-url.jpg', 'Columbia', '573c6cf8-cded-411f-8ae7-134967fcfdf8', '78c96b8f-bc81-4b76-9a32-0fd3354b28d9');