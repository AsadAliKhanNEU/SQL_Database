import sqlite3

#An Entree Database

#to represent an entree
CREATE TABLE entree (
    entreeID INT NOT NULL PRIMARY KEY,
    cost INT,
    ingredients VARCHAR(MAX),
    calories INT
    dishname varchar(max)
);
#to represent a meal
CREATE TABLE meal (
	mealID INT NOT NULL PRIMARY KEY,
	FOREIGN KEY entreeID INT,
	cost INT
);
#to represent a gluten_free entree
CREATE TABLE gluten_free (
	glutenfreeID NOT NULL INT PRIMARY KEY,
	FOREIGN KEY entreeID INT,
);
#to represent an entree below 500 calories
CREATE TABLE below_500 (
	dietID INT NOT NULL PRIMARY KEY,
	FOREIGN KEY entreeID INT,
);
#to represent a meatless entree
CREATE TABLE vegetarian (
	vegeterianID INT NOT NULL PRIMARY KEY,
	FOREIGN KEY entreeID INT,
);

#Steak Entree
INSERT INTO entree (entreeID, cost, ingredients, calories, dishname)
VALUES (001, 20, 'beef, pepper, salt, olive oil', 800, 'Steak')
INSERT INTO gluten_free (glutenfreeID, entreeID)
VALUES (001, 001)

#Salad Entree
INSERT INTO entree (entreeID, cost, ingredients, calories, dishname)
VALUES (004, 20, 'eggs, oregano, kale, lettuce, dressing, ham', 350, 'egg and ham salad')
INSERT INTO gluten_free (glutenfreeID, entreeID)
VALUES (003, 004)
INSERT INTO below_500 (dietID, entreeID)
VALUES (002, 004)

#Vegetarian Entree
INSERT INTO entree (entreeID, cost, ingredients, calories, dishname)
VALUES (002, 12, 'White Rice, Pinto Beans, Salt, Curry Powder', 300, 'Rice & Beans')
INSERT INTO gluten_free (glutenfreeID, entreeID)
VALUES (002, 002)
INSERT INTO below_500 (dietID, entreeID)
VALUES (001, 002)
INSERT INTO vegetarian (vegeterianID, entreeID)
VALUES (001, 002)

#Simple Entree 
INSERT INTO entree (entreeID, cost, ingredients, calories, dishname)
VALUES (003, 15, 'Pasta, Meatballs, Marinara Sauce, Cheese', 800, 'Spaghetti & Meatballs')

#A Meal 
INSERT INTO meal (mealID, entreeID, entreeID, cost)
VALUES (001, 001, 003, 35)

#Guest queries
#Get All from Entrees 
SELECT * FROM entree 
#Get Calories from Entrees
SELECT calories FROM entree
#Get all entrees that are gluten free
SELECT * FROM gluten_free
#Get all entrees that are vegetarian
SELECT * FROM vegetarian
#Price of a meal
SELECT cost FROM meal

#Guest on a diet query
#All Entrees below 500
SELECT * FROM below_500

#Manager query
#cost of an entree
SELECT cost FROM entree

#Chef query
#ingredients for an entree
SELECT ingredients FROM entree