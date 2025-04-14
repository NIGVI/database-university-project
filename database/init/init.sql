CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  filename TEXT NOT NULL UNIQUE,
  format TEXT NOT NULL,
  original TEXT NOT NULL UNIQUE,
  width_original INT NOT NULL,
  height_original INT NOT NULL,
  jpeg TEXT NOT NULL UNIQUE,
  webp TEXT NOT NULL UNIQUE,
  width INT NOT NULL,
  height INT NOT NULL,
  jpeg_middle TEXT NOT NULL UNIQUE,
  webp_middle TEXT NOT NULL UNIQUE,
  width_middle INT NOT NULL,
  height_middle INT NOT NULL,
  jpeg_small TEXT NOT NULL UNIQUE,
  webp_small TEXT NOT NULL UNIQUE,
  width_small INT NOT NULL,
  height_small INT NOT NULL,
  cover BOOLEAN DEFAULT FALSE,
  mark TEXT,
  alt TEXT
);

CREATE TABLE articles (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  url TEXT NOT NULL UNIQUE,
  url_old TEXT UNIQUE,
  meta_keywords TEXT,
  meta_description TEXT,
  published BOOLEAN DEFAULT FALSE,
  serial_number INT NOT NULL,
  content JSONB DEFAULT '[]',
  image_id INT REFERENCES images(id)
);

CREATE TABLE store_categories (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  type TEXT NOT NULL, -- enum: 'sections' | 'products' | 'url'
  url TEXT NOT NULL UNIQUE,
  url_old TEXT UNIQUE,
  meta_keywords TEXT,
  meta_description TEXT,
  description JSONB DEFAULT '[]',
  published BOOLEAN DEFAULT FALSE,
  serial_number INT NOT NULL,
  parent_id INT REFERENCES store_categories(id), -- Tree parent
  image_id INT REFERENCES images(id)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  price NUMERIC(50, 2),
  size_x INT,
  size_y INT,
  size_z INT,
  description JSONB DEFAULT '[]',
  diameter INT,
  material TEXT,
  manufacturer TEXT,
  meta_keywords TEXT,
  meta_description TEXT,
  url TEXT NOT NULL UNIQUE,
  url_old TEXT UNIQUE,
  published BOOLEAN DEFAULT FALSE,
  store_category_id INT REFERENCES store_categories(id)
);

CREATE TABLE image_to_product (
  id SERIAL PRIMARY KEY,
  serial_number INT NOT NULL,
  image_id INT REFERENCES images(id),
  product_id INT REFERENCES products(id)
);

CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  auto_price BOOLEAN DEFAULT FALSE,
  sum NUMERIC(50, 2),
  description JSONB DEFAULT '[]',
  price BOOLEAN DEFAULT FALSE,
  published BOOLEAN DEFAULT FALSE,
  store_category_id INT REFERENCES store_categories(id)
);

CREATE TABLE image_to_group (
  id SERIAL PRIMARY KEY,
  serial_number INT NOT NULL,
  image_id INT REFERENCES images(id),
  group_id INT REFERENCES groups(id)
);

CREATE TABLE gallery_categories (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  url TEXT NOT NULL UNIQUE,
  url_old TEXT UNIQUE,
  meta_keywords TEXT,
  meta_description TEXT,
  published BOOLEAN DEFAULT FALSE,
  serial_number INT NOT NULL
);

CREATE TABLE image_to_gallery (
  id SERIAL PRIMARY KEY,
  serial_number INT NOT NULL,
  image_id INT REFERENCES images(id),
  gallery_id INT REFERENCES gallery_categories(id)
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_name TEXT NOT NULL,
  user_surname TEXT NOT NULL,
  user_patronymic TEXT,
  phone_number TEXT NOT NULL
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  address TEXT,
  date_start TIMESTAMP NOT NULL,
  date_end TIMESTAMP,
  description TEXT,
  closed BOOLEAN DEFAULT FALSE,
  user_id INT REFERENCES users(id)
);

CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  sum NUMERIC(50, 2) DEFAULT 0,
  amount INT DEFAULT 1,
  serial_number INT NOT NULL,
  order_id INT REFERENCES orders(id),
  product_id INT REFERENCES products(id),
  group_id INT REFERENCES groups(id)
);
