/**
* Thr33books Database
* @author Kalenshi Katebe
* subject to aproval 
*/
DROP TABLE IF EXISTS  address;
DROP TABLE IF EXISTS  user;
DROP TABLE IF EXISTS  cover;
DROP TABLE IF EXISTS  authored;
DROP TABLE IF EXISTS  book;
DROP TABLE IF EXISTS  author;
DROP DATABASE IF EXISTS thr33books;


CREATE DATABASE thr33books;

CREATE TABLE user(
    _ID INT UNSIGNED NOT NULL,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    initials CHAR(2) DEFAULT '',
    is_verified Boolean DEFAULT FALSE,
    CONSTRAINT `user_pk` PRIMARY KEY (_ID)
);

CREATE TABLE address (
    _ID INT UNSIGNED NOT NULL,
    aptmnt INT UNSIGNED,
    street_no INT UNSIGNED,
    street_name VARCHAR(100) NOT NULL,
    postal_code CHAR(7) NOT NULL,
    city VARCHAR(100) NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    province ENUM ('NS','NL','PE','NB','QC','BC','YT','NT','NU','ON','AB','SK','MB'),
    CONSTRAINT `address_fk` FOREIGN KEY (user_id) REFERENCES user(_ID),
    CONSTRAINT `address_pk` PRIMARY KEY (_ID)
);

CREATE TABLE author (
    _ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    initials CHAR(2) DEFAULT '',
    url VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    CONSTRAINT `auth_pk` PRIMARY KEY (_ID)
);

CREATE TABLE book (
    _ID INT UNSIGNED NOT NULL,
    ISBN VARCHAR(13) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    edition INT UNSIGNED NOT NULL,
    CONSTRAINT `book_pk` PRIMARY KEY (_ID)
);

CREATE TABLE authored (
    author_id INT UNSIGNED NOT NULL,
    book_id INT UNSIGNED NOT NULL,
    CONSTRAINT `authored_pk` PRIMARY KEY (`author_id`, `book_id`),
    CONSTRAINT  `authored_book_fk` FOREIGN KEY (book_id) REFERENCES book(_ID),
    CONSTRAINT  `authored_fk` FOREIGN KEY (author_id) REFERENCES author(_ID)
);

CREATE TABLE cover (
    _ID INT UNSIGNED NOT NULL,
    URL VARCHAR(255) NOT NULL,
    book_id INT UNSIGNED NOT NULL,
    CONSTRAINT `cover_pk` PRIMARY KEY (_ID),
    CONSTRAINT `cover_fk` FOREIGN KEY (book_id) REFERENCES book(_ID)
);
