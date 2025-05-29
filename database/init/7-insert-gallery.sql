
INSERT INTO gallery_categories (
  title, url, url_old,
  meta_keywords, meta_description,
  published, serial_number
) VALUES 
('Камины', 'gallery-kaminy', NULL,
  NULL, NULL,
  TRUE, 1
),
('Наши скульптурно-модельные работы', 'gallery-nashi-skulpturno-modelnye-rabotyi', NULL,
  NULL, NULL,
  TRUE, 2
),
('Семь Звезд в Солнечном', 'gallery-sem-zvezd-v-solnechnom', NULL,
  NULL, NULL,
  TRUE, 3
),
('Ювелирный магазин', 'gallery-yuvelirnyiy-magazin', NULL,
  NULL, NULL,
  TRUE, 4
),
('Отель "Звезда"', 'gallery-otel-zvezda', NULL,
  NULL, NULL,
  TRUE, 5
),
('Колонны', 'gallery-kolonnyyi', NULL,
  NULL, NULL,
  TRUE, 6
);

INSERT INTO image_to_gallery (
  serial_number, image_id, gallery_id
) VALUES 
(1, 41, 1),
(1, 42, 2),
(1, 43, 3),
(1, 44, 4),
(1, 45, 5),
(1, 46, 6),
(2, 47, 6),
(2, 48, 6),
(2, 49, 6),
(2, 50, 6);
