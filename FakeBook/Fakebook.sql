create database Fakebook
go

USE Fakebook
create table USER_Account(
	id_user int not null,
	user_name nvarchar(50) not null,
	gender varchar(10),
	birthdate date,
	phone int,
	pass varchar(50) not null,
	info_name nvarchar(50),
	PRIMARY KEY(id_user)
	)

create table FRIENDSHIP(
	id_user_1 int not null,
	id_user_2 int not null,
	FOREIGN KEY(id_user_1) REFERENCES USER_Account(id_user),
	FOREIGN KEY(id_user_2) REFERENCES USER_Account(id_user),
	PRIMARY KEY(id_user_1, id_user_2)
	)

create table POST(
	 id_post int not null,
	 content nvarchar(100),
	 img varchar(10),
	 like_num int,
	 comment int,
	 id_user int not null,
	 PRIMARY KEY(id_post),
	 FOREIGN KEY(id_user) REFERENCES USER_Account(id_user)
	 )

create table LIKE_status(
	id_post int not null,
	id_user int not null,
	FOREIGN KEY(id_post) REFERENCES POST(id_post),
	FOREIGN KEY(id_user) REFERENCES USER_Account(id_user),
	PRIMARY KEY(id_post, id_user)
	)

create table COMMENT_status(
	id_post int not null,
	id_user int not null,
	Content nvarchar(50),
	FOREIGN KEY(id_post) REFERENCES POST(id_post),
	FOREIGN KEY(id_user) REFERENCES USER_Account(id_user),
	PRIMARY KEY(id_post, id_user, Content)
	)
