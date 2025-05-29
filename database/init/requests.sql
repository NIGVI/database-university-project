

-- Использую эти запросы для вывода информации в консоль
SELECT 'Запрос который выводит товары которые не опубликованы' AS output_text;

SELECT id, title, price
FROM products
WHERE published = FALSE;


SELECT 'Запрос для получения количества товаров в каждой категории' AS output_text;
SELECT 'с удалением из списка пустых категорий и сортировкой по количеству товаров' AS output_text;

SELECT
  sc.id category_id,
  sc.title category_title,
  COUNT(DISTINCT p.id) product_count,
  COUNT(DISTINCT g.id) group_count
FROM
  store_categories sc
LEFT JOIN
  products p ON sc.id = p.store_category_id
LEFT JOIN
  groups g ON sc.id = g.store_category_id
GROUP BY
  sc.id, sc.title
HAVING
  COUNT(DISTINCT p.id) > 0 OR COUNT(DISTINCT g.id) > 0
ORDER BY
  (COUNT(DISTINCT p.id) + COUNT(DISTINCT g.id)) DESC;


SELECT 'Запрос для получения товаров в категории с id = 2' AS output_text;
SELECT 'с использованием пагинации через limit и offset' AS output_text;
SELECT 'и получения изображений для каждого товара' AS output_text;

SELECT
  p.id product_id,
  p.title product_title,
  p.price product_price,
  i.id image_id,
  i.filename image_filename,
  i.webp_middle image_webp_middle
FROM
  products p
LEFT JOIN
  image_to_product itp ON p.id = itp.product_id
LEFT JOIN
  images i ON itp.image_id = i.id
WHERE
  p.store_category_id = 2
LIMIT 5 OFFSET 0;



SELECT 'Запрос для получения всех категорий галереи с изображениями для каждой категории' AS output_text;
SELECT 'Используется JSON_AGG для агрегации изображений в массив' AS output_text;

SELECT
  gc.id gallery_category_id,
  gc.title gallery_category_title,
  JSON_AGG(
    JSON_BUILD_OBJECT(
      'image_id', i.id,
      'filename', i.filename,
      'webp_middle', i.webp_middle
    )
  ) images
FROM
  gallery_categories gc
LEFT JOIN
  image_to_gallery itg ON gc.id = itg.gallery_id
LEFT JOIN
  images i ON itg.image_id = i.id
GROUP BY
  gc.id, gc.title;


SELECT 'Запрос который выводит 5 самых частых товаров в заказе' AS output_text;
SELECT 'с использованием подзапроса для получения количества заказов на данный товар' AS output_text;

SELECT
  p.id product_id,
  p.title product_title,
  p.price product_price,
  (
    SELECT COUNT(*)
    FROM order_items oi
    WHERE oi.product_id = p.id
  ) order_count
FROM
  products p
WHERE
  p.published = TRUE
ORDER BY
  order_count DESC
LIMIT 5 OFFSET 0;


SELECT 'Запрос который выводит 5 товаров с наибольшим количеством проданных штук' AS output_text;

SELECT
  p.id product_id,
  p.title product_title,
  p.price product_price,
  (
    SELECT COALESCE(SUM(oi.amount), 0)
    FROM order_items oi
    WHERE oi.product_id = p.id
  ) amount_all
FROM
  products p
WHERE
  p.published = TRUE
ORDER BY
  amount_all DESC
LIMIT 5 OFFSET 0;


SELECT 'Запрос который выводит 5 самых частых товаров в заказе' AS output_text;
SELECT 'и 5 товаров с наибольшим количеством проданных штук' AS output_text;

SELECT
  p.id product_id,
  p.title product_title,
  p.price product_price,
  (
    SELECT COUNT(*)
    FROM order_items oi
    WHERE oi.product_id = p.id
  ) order_count,
  (
    SELECT COALESCE(SUM(oi.amount), 0)
    FROM order_items oi
    WHERE oi.product_id = p.id
  ) amount_all
FROM
  products p
WHERE
  p.published = TRUE
ORDER BY
  order_count DESC,
  amount_all DESC
LIMIT 5 OFFSET 0;


SELECT 'Запрос для получения списка пользователей с количеством заказов и количеством проданных товаров' AS output_text;

SELECT
  u.id,
  u.user_name,
  COUNT(DISTINCT o.id) order_count,
  COALESCE(SUM(oi.amount), 0) amount_all
FROM
  users u
LEFT JOIN
  orders o ON u.id = o.user_id
LEFT JOIN
  order_items oi ON o.id = oi.order_id
GROUP BY
  u.id
ORDER BY
  amount_all DESC;


SELECT 'Запрос для получения списка всех статей с их названиями и именами изображений' AS output_text;

SELECT
  a.id article_id,
  a.title article_title,
  a.url article_url,
  i.filename image_filename
FROM
  articles a
LEFT JOIN
  images i ON a.image_id = i.id;


SELECT 'Запрос для получения статистики по соотношением сторон изображений' AS output_text;

WITH aspect_ratios AS (
  SELECT
    CASE
      WHEN width > height THEN 'Landscape'
      WHEN width < height THEN 'Portrait'
      ELSE 'Square'
    END AS aspect_ratio
  FROM images
)
SELECT
  aspect_ratio,
  COUNT(*) AS image_count
FROM aspect_ratios
GROUP BY aspect_ratio;

-- Запрос для получения средней цены товаров в каждой категории
-- с сортировкой по средней цене по убыванию

-- Запрос для получения списка товаров, которые никогда не были заказаны
-- с указанием их категории и цены

-- Запрос для получения всех заказов, в которых есть товары из категории с id = 3
-- с указанием количества товаров из этой категории в каждом заказе

-- Запрос для получения списка пользователей, которые сделали больше 10 заказов
-- с указанием общего количества заказов и общей суммы всех их заказов

-- Запрос для получения списка товаров, которые были заказаны в последний месяц
-- с указанием количества заказов и общей суммы проданных штук

-- Запрос для получения списка категорий, в которых есть товары со скидкой
-- с указанием количества таких товаров в каждой категории

-- Запрос для получения списка товаров, у которых есть изображения, но они не опубликованы
-- с указанием количества изображений для каждого товара

-- Запрос для получения списка заказов, в которых есть товары с ценой выше 1000
-- с указанием общего количества таких товаров в каждом заказе