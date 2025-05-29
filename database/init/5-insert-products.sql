
INSERT INTO products (
  title, price,
  size_x, size_y, size_z,
  meta_keywords, meta_description,
  url, url_old,
  published, store_category_id
) VALUES 
('Декор De300', 1000,
  NULL, NULL, NULL,
  NULL, NULL,
  'decor-de300', NULL,
  FALSE, 2
),
('Декор De400', 3000,
  NULL, NULL, NULL,
  NULL, NULL,
  'decor-de400', NULL,
  TRUE, 2
),
('Декор 8034', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'decor-8034', NULL,
  TRUE, 2
),
('Декор 8035', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'decor-8035', 7400,
  TRUE, 2
),
('Декор Kr208', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'decor-kr208', NULL,
  FALSE, 2
),
('Декор Лев L1', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'decor-lev-l1', NULL,
  TRUE, 2
),
('Декор Лев L2', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'decor-lev-l2', NULL,
  TRUE, 2
),

-- 8
('Карниз (плинтус) Ca187', 3333,
  NULL, NULL, NULL,
  NULL, NULL,
  'karniz-plintus-ca187', NULL,
  TRUE, 5
),
('Карниз (плинтус) Ca205', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'karniz-plintus-ca205', NULL,
  FALSE, 5
),
('Карниз (плинтус) Ca210', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'karniz-plintus-ca210', 7621,
  TRUE, 5
),
('Карниз (потолочный плинтус) Ca104', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'karniz-potolochnyj-plintus-ca104', NULL,
  TRUE, 5
),
('Карниз (потолочный плинтус) Ca105', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'karniz-potolochnyj-plintus-ca105', 3940,
  FALSE, 5
),

-- 13
('Декоративный элемент Ca136', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'dekorativnyj-element-ca136', NULL,
  FALSE, 10
),
('Декоративный элемент Ca149', 5000,
  NULL, NULL, NULL,
  NULL, NULL,
  'dekorativnyj-element-ca149', NULL,
  TRUE, 10
),
('Решетка VR1', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'reshetka-vr1', NULL,
  FALSE, 10
),
('Решетка VR2', 4000,
  NULL, NULL, NULL,
  NULL, NULL,
  'reshetka-vr2', NULL,
  TRUE, 10
),
('Решетка VR3 вертикальная', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'reshetka-vr3-vertikalnaya', 2500,
  TRUE, 10
),

-- 18
('Элемент обрамления окна Ob-200', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'element-window-ob-200', 5000,
  TRUE, 3
),
('Карниз цокольный и подоконный 147', NULL,
  NULL, NULL, NULL,
  NULL, NULL,
  'karniz-147', 4500,
  TRUE, 11
);

INSERT INTO image_to_product (
  serial_number, image_id, product_id
) VALUES 
(1, 11, 1),
(1, 12, 2),
(1, 13, 3),
(1, 14, 4),
(1, 15, 5),
(1, 16, 6),
(1, 17, 7),
(1, 18, 8),
(1, 19, 9),
(1, 20, 10),
(1, 21, 11),
(1, 22, 12),
(1, 23, 13),
(1, 24, 14),
(1, 25, 15),
(1, 26, 16),
(1, 27, 17),
(1, 28, 18),
(2, 29, 18),
(3, 30, 18);
