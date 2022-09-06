/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
 Select p.Name As Product, c.Name as Category
 From products as p
 Inner Join categories As c on c.CategoryID = p.CategoryID
 Where c.Name = 'Computers';

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
Select p.Name, p.Price, r.Rating From products as p
Inner Join reviews as r ON r.ProductID = p.ProductID
Where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select e.FirstName, e.LastName, Sum(s.Quantity) AS Total From sales as s
Inner Join employees as e On e.EmployeeID = s. EmployeeID
Group By e.EmployeeID
Order By Total desc;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.Name as 'Deparment Name', c.Name as 'Category Name' from categories as c
Inner Join departments as d ON d.DepartmentID = c.DepartmentID
Where c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 Select p.Name, Sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
 From products as p
 Inner Join sales as s on s.ProductID = p.ProductID
 Where p.ProductID = 97;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select p.Name, r.Reviewer, r.Rating, r.Comment From products as p
Inner Join reviews as r On r.ProductID = p.ProductID
Where p.ProductID = 857 AND r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
Select e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) as TotalSold
From Sales as s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
Inner Join products as p on p.ProductID = s.ProductID
Group By e.EmployeeID, p. ProductID;

