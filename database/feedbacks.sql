CREATE DATABASE feedbacks;
USE feedbacks;
CREATE TABLE feedbacks(
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,
    assistant_id INT NOT NULL,
    prompt VARCHAR(2058) NOT NULL,
    response VARCHAR(2058) NOT NULL,

    rating ENUM('1', '2', '3', '4', '5'),
    feedback VARCHAR(2058),
    status ENUM('Resolved', 'Pending') DEFAULT 'Pending',

    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (assistant_id) REFERENCES assistants.assistants(assistant_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    FOREIGN KEY (user_id) REFERENCES users.users(user_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);