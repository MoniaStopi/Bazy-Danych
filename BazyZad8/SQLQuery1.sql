SELECT * FROM HumanResources.EmployeePayHistory
SELECT * FROM Person.Person
--ZAD 1
--A)
begin
SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory AS Srednia
end;
--B)
begin
SELECT FirstName, LastName, Rate, HumanResources.EmployeePayHistory.BusinessEntityID 
FROM HumanResources.EmployeePayHistory 
INNER JOIN Person.Person 
ON HumanResources.EmployeePayHistory.BusinessEntityID = Person.Person.BusinessEntityID
WHERE HumanResources.EmployeePayHistory.Rate < (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory )
end;


--ZAD 2
SELECT * FROM Sales.SalesOrderHeader

GO
CREATE OR ALTER FUNCTION WhenOrderSent(@SalesOrderID INT)
RETURNS TABLE 
RETURN 
	SELECT OrderDate, SalesOrderID FROM Sales.SalesOrderHeader
	WHERE SalesOrderID = @SalesOrderID      
GO
SELECT * FROM WhenOrderSent(43661)


--ZAD 3
SELECT * FROM Production.Product
SELECT * FROM Production.ProductInventory
SELECT * FROM Production.Location

GO
CREATE OR ALTER PROCEDURE CheckAva(@ProductName NVARCHAR(50))
AS
BEGIN
SELECT P.ProductID, ProductNumber, Availability, PI.LocationID FROM Production.Product AS P
INNER JOIN Production.ProductInventory AS PI
ON P.ProductID = PI.ProductID 
INNER JOIN Production.Location AS PL
ON PL.LocationID = PI.LocationID
WHERE P.Name = @ProductName
END;
GO
EXEC CheckAva @ProductName = 'Blade'



--ZAD 4
SELECT * FROM Sales.CreditCard AS SCC

GO
CREATE OR ALTER FUNCTION ShowCreditCardNum (@OrderID INT)
RETURNS TABLE AS
RETURN
SELECT SalesOrderID, SSC.CreditCardID, CardNumber FROM Sales.SalesOrderHeader As SSOH
INNER JOIN Sales.CreditCard AS SSC
ON SSOH.CreditCardID = SSC.CreditCardID
WHERE SalesOrderID = @OrderID
GO
SELECT * FROM ShowCreditCardNum(43661)

--ZAD 5
GO
	CREATE OR ALTER PROCEDURE Procedure_Divide( @Num1 Decimal(7,2), @Num2 Decimal(7,2), @Result Varchar(30) OUT)    
		AS
			IF @Num1 >@Num2 
				BEGIN
				SET @Result = @Num1 / @Num2
				END
			IF @Num1 < @Num2 OR @Num2 = 0
				BEGIN
				SET @Result= 'Zle zdefiniowana wartosc';
				END  
GO

DECLARE @Result Varchar(30)
EXEC dbo.Procedure_Divide @Num1 = 4.1, @Num2 = 2 , @Result = @Result OUTPUT  
SELECT @Result

--ZAD 6
--NationalIDNumber 112457891
GO
CREATE OR ALTER PROCEDURE AbsenceQuantity(@NationalIDNumber nvarchar(15))
AS 
SELECT JobTitle, VacationHours, SickLeaveHours FROM HumanResources.Employee AS HRE
WHERE HRE.NationalIDNumber = @NationalIDNumber
GO

EXEC dbo.AbsenceQuantity @NationalIDNumber = 112457891

--ZAD 7
SELECT * FROM Sales.Currency
SELECT * FROM Sales.CurrencyRate
WHERE ToCurrencyCode = 'ARS'
--DO DOKONCZENIA
GO
CREATE OR ALTER PROCEDURE CurrencyCalculator (@Money INT, @ToCurrencyCode nchar(3), @ModifiedDate datetime)
AS
SELECT 
	CONCAT(
		'1 USD = ',AverageRate , ' ', ToCurrencyCode, ' ( ', Name, ' )',
		'  Date : ', SCR.ModifiedDate ,
		' USD -> ', ToCurrencyCode  , '    Your change : ', @Money / AverageRate, ' ', ToCurrencyCode, '	  ',
		ToCurrencyCode, ' -> USD ',' Your change : ', @Money * AverageRate , ' USD'
	)
FROM Sales.CurrencyRate SCR
INNER JOIN Sales.Currency SC
ON SCR.ToCurrencyCode = SC.CurrencyCode
WHERE SCR.ToCurrencyCode = @ToCurrencyCode AND SCR.ModifiedDate = @ModifiedDate
GO
EXEC dbo.CurrencyCalculator @Money=300 , @ToCurrencyCode = 'AUD', @ModifiedDate = '2011-05-31'





