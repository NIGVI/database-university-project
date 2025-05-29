
INSERT INTO groups (
  title, published, store_category_id
) VALUES
('Обрамления окна DB8', TRUE, 3),
('Обрамления окна DN1', TRUE, 3);

INSERT INTO image_to_group (
  serial_number, image_id, group_id
) VALUES
(1, 28, 1),
(1, 29, 2);

INSERT INTO group_items (
  serial_number, product_id, group_id
) VALUES
-- (1, 1, ?),
-- (1, 2, ?),
(2, 18, 1),
(2, 18, 2),
(3, 19, 1),
(3, 19, 2);
