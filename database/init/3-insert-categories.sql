
INSERT INTO store_categories (
  title, type,
  url, url_old,
  meta_keywords, meta_description,
  published, serial_number,
  parent_id, image_id
) VALUES 
('Архитектурные элементы из бетона', 'sections',
  'arhitekturnye-elementy-iz-betona', '/фасадный-лепной-декор',
  NULL, NULL,
  TRUE, 1,
  NULL, 1
),
('Декоративные элементы', 'products',
  'dekorativnye-elementy', NULL,
  NULL, NULL,
  TRUE, 1,
  1, 2
),
('Оформление окон', 'products',
  'oformlenie-okon', NULL,
  NULL, NULL,
  TRUE, 2,
  1, 3
),

-- 4
('Лепной декор из гипса', 'sections',
  'lepnoy-dekor-iz-gipsa', NULL,
  NULL, NULL,
  TRUE, 2,
  NULL, 4
),
('Карнизы с орнаментом', 'products',
  'karnizy-s-ornamentom', NULL,
  NULL, NULL,
  TRUE, 1,
  4, 5
),
('Карнизы без орнамента', 'products',
  'karnizy-bez-ornamenta', NULL,
  NULL, NULL,
  TRUE, 2,
  4, 6
),
('Потолочные розетки', 'products',
  'potolochnye-rozetki', NULL,
  NULL, NULL,
  TRUE, 3,
  4, 7
),
('Колонны', 'products',
  'kolonny', NULL,
  NULL, NULL,
  TRUE, 4,
  4, 8
),
('Пилястры', 'products',
  'pilyastry', NULL,
  NULL, NULL,
  TRUE, 5,
  4, 9
),
('Декоративные решетки', 'products',
  'dekorativnye-reshetki', NULL,
  NULL, NULL,
  TRUE, 7,
  4, 10
),

-- 11
('Карнизы', 'products',
  'karniz', NULL,
  NULL, NULL,
  TRUE, 3,
  1, 51
);