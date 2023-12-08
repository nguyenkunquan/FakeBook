-- Tạo cơ sở dữ liệu Fakebook
CREATE DATABASE Fakebook;
USE Fakebook;

-- Tạo bảng USER_Account
CREATE TABLE user_account (
    id_user VARCHAR(10) NOT null,
    user_name VARCHAR(50) PRIMARY KEY NOT NULL,
	 pass VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    birthday  DATE,
    phone VARCHAR(20),
    email VARCHAR(50),
    first_Name NVARCHAR(50),
    last_Name NVARCHAR(50),
    avatar VARCHAR(255),
    background VARCHAR(255)
);
SELECT * FROM user_account
WHERE user_name = 'Submible'
-- Tạo bảng FRIENDSHIP
CREATE TABLE FRIENDSHIP (
    user_name_1 VARCHAR(50) NOT NULL,
    user_name_2 VARCHAR(50) NOT NULL,
    FOREIGN KEY(user_name_1) REFERENCES USER_Account(user_name),
    FOREIGN KEY(user_name_2) REFERENCES USER_Account(user_name),
    PRIMARY KEY(user_name_1, user_name_2)
);

-- Tạo bảng POST
CREATE TABLE POST (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    content NVARCHAR(10000),
    img VARCHAR(10),
    like_num INT,
    comment INT,
    user_name VARCHAR(50) NOT NULL,
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_name) REFERENCES USER_Account(user_name)
);

-- Tạo bảng LIKE_status
CREATE TABLE LIKE_status (
    id_post INT NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    FOREIGN KEY(id_post) REFERENCES POST(id_post),
    FOREIGN KEY(user_name) REFERENCES USER_Account(user_name),
    PRIMARY KEY(id_post, user_name)
);

-- Tạo bảng COMMENT_status
CREATE TABLE COMMENT_status (
    id_comment INT AUTO_INCREMENT PRIMARY KEY,
    id_post INT NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    content NVARCHAR(10000),
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(id_post) REFERENCES POST(id_post),
    FOREIGN KEY(user_name) REFERENCES USER_Account(user_name)
);
	
-- Tạo trigger IncreaseCommentNum
DELIMITER //
CREATE TRIGGER IncreaseCommentNum
AFTER INSERT
ON COMMENT_status FOR EACH ROW
BEGIN
    DECLARE postId INT;
    SELECT NEW.id_post INTO postId;

    IF EXISTS (SELECT 1 FROM POST WHERE id_post = postId) THEN
        UPDATE POST
        SET comment = comment + 1
        WHERE id_post = postId;
    END IF;
END;
//
DELIMITER ;
-- Tạo trigger DecreaseCommentNum
DELIMITER //
CREATE TRIGGER DecreaseCommentNum
AFTER DELETE
ON COMMENT_status FOR EACH ROW
BEGIN
    DECLARE postId INT;
    SELECT OLD.id_post INTO postId;

    IF EXISTS (SELECT 1 FROM POST WHERE id_post = postId) THEN
        UPDATE POST
        SET comment = comment - 1
        WHERE id_post = postId;
    END IF;
END;
//
DELIMITER ;
-- Tạo trigger IncreaseLikeNum
DELIMITER //
CREATE TRIGGER IncreaseLikeNum
AFTER INSERT
ON LIKE_status FOR EACH ROW
BEGIN
    DECLARE postId INT;
    SELECT NEW.id_post INTO postId;

    IF EXISTS (SELECT 1 FROM POST WHERE id_post = postId) THEN
        UPDATE POST
        SET like_num = like_num + 1
        WHERE id_post = postId;
    END IF;
END;
//
DELIMITER ;
-- Tạo trigger DecreaseLikeNum
DELIMITER //
CREATE TRIGGER DecreaseLikeNum
AFTER DELETE
ON LIKE_status FOR EACH ROW
BEGIN
    DECLARE postId INT;
    SELECT OLD.id_post INTO postId;

    IF EXISTS (SELECT 1 FROM POST WHERE id_post = postId) THEN
        UPDATE POST
        SET like_num = like_num - 1
        WHERE id_post = postId;
    END IF;
END;
DELIMITER ;
DROP TABLE user_account
DROP TABLE FRIENDSHIP
DROP TABLE POST
DROP TABLE LIKE_status
DROP TABLE COMMENT_status
