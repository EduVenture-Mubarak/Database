CREATE DATABASE IF NOT EXISTS EduVenture;
USE EduVenture;
CREATE TABLE IF NOT EXISTS Student (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    HashedPassword VARCHAR(255),
    FullName VARCHAR(255) NOT NULL,
    GoogleToken VARCHAR(255),
    FacebookToken VARCHAR(255),
    Token VARCHAR(255),
    Country VARCHAR(100),
    Avatar VARCHAR(255),
    Birthday DATE,
    Gender ENUM('M', 'F')
);
