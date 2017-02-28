drop database if exists cupcakeshop;
create database cupcakeshop;
use cupcakeshop;

CREATE TABLE bottoms (
    bno INT AUTO_INCREMENT,
    bottom VARCHAR(255),
    price DECIMAL(5 , 2 ),
    PRIMARY KEY (bno)
);

CREATE TABLE toppings (
    tno INT AUTO_INCREMENT,
    topping VARCHAR(255),
    price DECIMAL(5 , 2 ),
    PRIMARY KEY (tno)
);

CREATE TABLE users (
    uno INT AUTO_INCREMENT,
    uname VARCHAR(255) UNIQUE,
    hashedpw VARCHAR(255),
    salt VARCHAR(255),
    balance DECIMAL(5 , 2 ),
    PRIMARY KEY (uno)
);

CREATE TABLE orders (
    ono INT AUTO_INCREMENT,
    bno INT,
    tno INT,
    totalPrice DECIMAL(5 , 2 ),
    PRIMARY KEY (ono),
    FOREIGN KEY (bno)
        REFERENCES bottoms (bno),
    FOREIGN KEY (tno)
        REFERENCES toppings (tno)
);