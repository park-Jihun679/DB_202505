-- Orders
INSERT INTO orders (order_id, total_price)
VALUES ('order_001', 10000);
INSERT INTO orders (order_id, total_price)
VALUES ('order_002', 17000);
INSERT INTO orders (order_id, total_price)
VALUES ('order_003', 23500);

-- Menu Items
INSERT INTO menu_items (menu_item_id, name, price)
VALUES ('menu_001', '카레라이스', 7000);
INSERT INTO menu_items (menu_item_id, name, price)
VALUES ('menu_002', '카레우동', 8000);
INSERT INTO menu_items (menu_item_id, name, price)
VALUES ('menu_003', '카레라면', 5000);

-- Toppings
INSERT INTO toppings (topping_id, name, price)
VALUES ('topping_001', '날계란', 500);
INSERT INTO toppings (topping_id, name, price)
VALUES ('topping_002', '고로케', 2500);
INSERT INTO toppings (topping_id, name, price)
VALUES ('topping_003', '게살튀김', 3000);
INSERT INTO toppings (topping_id, name, price)
VALUES ('topping_004', '닭가라아게', 4000);
INSERT INTO toppings (topping_id, name, price)
VALUES ('topping_005', '표고버섯', 2000);

-- Order Menu Items
INSERT INTO order_menu_items (order_menu_item_id, order_id, menu_item_id, spicy_level)
VALUES (1, 'order_001', 'menu_001', 3);
INSERT INTO order_menu_items (order_menu_item_id, order_id, menu_item_id, spicy_level)
VALUES (2, 'order_002', 'menu_002', 1);
INSERT INTO order_menu_items (order_menu_item_id, order_id, menu_item_id, spicy_level)
VALUES (3, 'order_003', 'menu_001', 5);
INSERT INTO order_menu_items (order_menu_item_id, order_id, menu_item_id, spicy_level)
VALUES (4, 'order_003', 'menu_003', 4);
INSERT INTO order_menu_items (order_menu_item_id, order_id, menu_item_id, spicy_level)
VALUES (5, 'order_003', 'menu_001', 5);

-- Menu Item Toppings
INSERT INTO menu_item_toppings (order_menu_topping_id, order_menu_item_id, topping_id)
VALUES (1, 1, 'topping_001');
INSERT INTO menu_item_toppings (order_menu_topping_id, order_menu_item_id, topping_id)
VALUES (2, 1, 'topping_002');
INSERT INTO menu_item_toppings (order_menu_topping_id, order_menu_item_id, topping_id)
VALUES (3, 2, 'topping_003');
INSERT INTO menu_item_toppings (order_menu_topping_id, order_menu_item_id, topping_id)
VALUES (4, 2, 'topping_004');
INSERT INTO menu_item_toppings (order_menu_topping_id, order_menu_item_id, topping_id)
VALUES (5, 2, 'topping_005');
INSERT INTO menu_item_toppings (order_menu_topping_id, order_menu_item_id, topping_id)
VALUES (6, 3, 'topping_001');
INSERT INTO menu_item_toppings (order_menu_topping_id, order_menu_item_id, topping_id)
VALUES (7, 3, 'topping_004');


-- 원본보기
SELECT o.order_id      AS 주문번호,
       mi.menu_item_id AS 주메뉴번호,
       mi.name         AS 메뉴이름,
       mi.price        AS 메뉴가격,
       omi.spicy_level AS 매운맛정도,
       t.topping_id    AS 토핑메뉴코드,
       t.name          AS 토핑메뉴,
       t.price         AS 가격,
       o.total_price   AS 결제금액
FROM orders o
         JOIN order_menu_items omi ON o.order_id = omi.order_id
         JOIN menu_items mi ON omi.menu_item_id = mi.menu_item_id
         LEFT JOIN menu_item_toppings mit ON omi.order_menu_item_id = mit.order_menu_item_id
         LEFT JOIN toppings t ON mit.topping_id = t.topping_id
ORDER BY o.order_id, omi.order_menu_item_id;

-- 주방용 주문서로 뽑아보기
SELECT omi.order_menu_item_id                                              AS 주문메뉴ID,
       mi.name                                                             AS 메뉴이름,
       omi.spicy_level                                                     AS 매운맛정도,
       -- group_concat : 여러 행의 값을 하나의 문자열로 연결해주는 함수
       -- coalesce : null 이 아닌 첫번째 값을 반환
       COALESCE(GROUP_CONCAT(t.name ORDER BY t.name SEPARATOR ', '), '없음') AS 토핑목록
FROM order_menu_items omi
         JOIN menu_items mi
              ON omi.menu_item_id = mi.menu_item_id
         LEFT JOIN menu_item_toppings mit
                   ON mit.order_menu_item_id = omi.order_menu_item_id
         LEFT JOIN toppings t
                   ON mit.topping_id = t.topping_id
GROUP BY omi.order_menu_item_id, mi.name, omi.spicy_level
ORDER BY omi.order_menu_item_id;