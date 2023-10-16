
SELECT * FROM users;
SELECT * FROM friendships;

DELETE FROM friendships WHERE id IN (9,8,7);

SELECT u1.first_name, u1.last_name, u2.first_name AS friend_first_name, u2.last_name AS friend_last_name
FROM friendships fs
JOIN users u2 ON fs.user_id = u2.id
JOIN users u1 ON fs.friend_id = u1.id;

-- Consulta 1
SELECT u1.first_name AS user_first_name, u1.last_name AS user_last_name, u2.first_name AS friend_first_name, u2.last_name AS friend_last_name
FROM friendships f
JOIN users u2 ON f.user_id = u2.id
JOIN users u1 ON f.friend_id = u1.id
WHERE f.user_id = (SELECT id FROM users WHERE first_name = 'Kermit');


-- Consulta 2
SELECT COUNT(*) AS friendship_count
FROM friendships;

-- Consulta 3
SELECT u1.first_name, u1.last_name, COUNT(*) AS friend_count
FROM friendships f
JOIN users u1 ON f.user_id = u1.id
GROUP BY f.user_id
ORDER BY friend_count DESC
LIMIT 1;

-- Consulta 4
INSERT INTO users (first_name, last_name, created_at)
VALUES ('Eduardo', 'Vera', NOW()); -- Al insertarse se crea en el ID numero 6 debido al orden de los demas usuarios de la tabla.

INSERT INTO friendships (user_id, friend_id, created_at)
VALUES (6, (SELECT id FROM users WHERE first_name = 'Eli' AND last_name = 'Byers'), NOW());

INSERT INTO friendships (user_id, friend_id, created_at)
VALUES (6, (SELECT id FROM users WHERE first_name = 'Kermit' AND last_name = 'The Frog'), NOW());

INSERT INTO friendships (user_id, friend_id, created_at)
VALUES (6, (SELECT id FROM users WHERE first_name = 'Marky' AND last_name = 'Mark'), NOW());

-- Consulta 5
SELECT u.first_name, u.last_name
FROM friendships f
JOIN users u ON f.friend_id = u.id
WHERE f.user_id = (SELECT id FROM users WHERE first_name = 'Eli')
ORDER BY u.last_name, u.first_name;

-- Consulta 6
DELETE FROM friendships
WHERE user_id = (SELECT id FROM users WHERE first_name = 'Eli')
  AND friend_id = (SELECT id FROM users WHERE first_name = 'Marky' AND last_name = 'Mark');

-- Consulta 7 
SELECT u1.first_name AS user_first_name, u1.last_name AS user_last_name, u2.first_name AS friend_first_name, u2.last_name AS friend_last_name
FROM friendships f
JOIN users u1 ON f.user_id = u1.id
JOIN users u2 ON f.friend_id = u2.id;

