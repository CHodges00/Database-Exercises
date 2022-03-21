use join_test_db;

INSERT INTO users (name, email, role_id)
VALUES ('CODY', 'CODY@example.com', 2),
       ('JOHN', 'JOHN@example.com', 2),
       ('TIM', 'TIM@example.com', 2),
       ('TOM', 'TOM@example.com', null);



SELECT users.name as user_name, roles.name as role_name
FROM users
         JOIN roles ON users.role_id = roles.id;



SELECT users.name as user_name, roles.name as role_name
FROM roles
         LEFT JOIN users ON users.role_id = roles.id;


SELECT users.name AS user_name, roles.name AS role_name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;
