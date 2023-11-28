﻿-- Tạo cơ sở dữ liệu Fakebook
CREATE DATABASE IF NOT EXISTS Fakebook;
USE Fakebook;

-- Tạo bảng USER_Account
CREATE TABLE USER_Account (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    user_name NVARCHAR(50) NOT NULL,
	pass VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    birthdate DATE,
    phone VARCHAR(10),
    email VARCHAR(50),
    first_Name NVARCHAR(50),
    last_Name NVARCHAR(50),
    registerTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng FRIENDSHIP
CREATE TABLE FRIENDSHIP (
    id_user_1 INT NOT NULL,
    id_user_2 INT NOT NULL,
    FOREIGN KEY(id_user_1) REFERENCES USER_Account(id_user),
    FOREIGN KEY(id_user_2) REFERENCES USER_Account(id_user),
    PRIMARY KEY(id_user_1, id_user_2)
);

-- Tạo bảng POST
CREATE TABLE POST (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    content NVARCHAR(100),
    img VARCHAR(10),
    like_num INT,
    comment INT,
    id_user INT NOT NULL,
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(id_user) REFERENCES USER_Account(id_user)
);

-- Tạo bảng LIKE_status
CREATE TABLE LIKE_status (
    id_post INT NOT NULL,
    id_user INT NOT NULL,
    FOREIGN KEY(id_post) REFERENCES POST(id_post),
    FOREIGN KEY(id_user) REFERENCES USER_Account(id_user),
    PRIMARY KEY(id_post, id_user)
);

-- Tạo bảng COMMENT_status
CREATE TABLE COMMENT_status (
    id_post INT NOT NULL,
    id_user INT NOT NULL,
    content NVARCHAR(50),
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(id_post) REFERENCES POST(id_post),
    FOREIGN KEY(id_user) REFERENCES USER_Account(id_user),
    PRIMARY KEY (id_post, id_user, content)
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
 