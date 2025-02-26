USE feedbacks;
DELIMITER $$

CREATE PROCEDURE create_feedback_instance(
    IN _assistant_id INT,
    IN _prompt VARCHAR(2058),
    IN _response VARCHAR(2058),
    IN _user_id INT
)
BEGIN
    INSERT INTO feedbacks (assistant_id, prompt, response, user_id)
    VALUES (_assistant_id, _prompt, _response, _user_id);
END $$

CREATE PROCEDURE create_feedback(
    IN _feedback_id INT,
    IN _rating CHAR(1),
    IN _feedback VARCHAR(2058)
)
BEGIN
    UPDATE feedbacks
    SET rating = _rating, feedback = _feedback
    WHERE feedback_id = _feedback_id;
END $$

CREATE PROCEDURE resolve_feedback(IN _feedback_id INT)
BEGIN
    UPDATE feedbacks
    SET status = 'Resolve'
    WHERE feedback_id = _feedback_id;
END $$

DELIMITER ;