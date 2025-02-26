USE users;
DELIMITER $$

CREATE PROCEDURE create_user_instance(
    IN _first_name VARCHAR(64),
    IN _last_name VARCHAR(64),
    IN _username VARCHAR(64),
    IN _password VARCHAR(64)
)
BEGIN
    INSERT INTO users (username, password, first_name, last_name)
    VALUES (_username, _password, _first_name, _last_name);
END $$

CREATE PROCEDURE update_user_instance(
    IN _first_name VARCHAR(64),
    IN _last_name VARCHAR(64),
    IN _username VARCHAR(64),
    IN _password VARCHAR(64)
)
BEGIN
    UPDATE users
    SET first_name = _first_name, last_name = _last_name, password = _password
    WHERE username = _username;
END $$

CREATE PROCEDURE verify_user(
    IN _username VARCHAR(64),
    IN _password VARCHAR(512)
)
BEGIN
    SELECT first_name, last_name
    FROM users
    WHERE username = _username AND password = _password;
END $$

DELIMITER ;