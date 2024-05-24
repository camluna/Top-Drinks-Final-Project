USE TopDrinksDB

-----------------------------------REVISIÓN DE LA TABLA PURCHASE PRICES-------------------------------------------------
SELECT*
FROM SalesFINAL12312016_Clean
--ORDER BY VendorNumber

-- Contar la cantidad de registros en la tabla PurchasePrices
SELECT COUNT(*) AS TotalRegistros
FROM InvoicePurchases12312016_Clean;

-- Contar la cantidad de valores únicos en la columna PONumber PurchasePrices
SELECT COUNT(DISTINCT PONumber) AS ValoresUnicos
FROM InvoicePurchases12312016_Clean;

SELECT Description, COUNT(*) AS Repeticiones
FROM [2017PurchasePricesDec_Clean]
GROUP BY Description
HAVING COUNT(*) > 1;

SELECT *
FROM [2017PurchasePricesDec_Clean]
WHERE Description= 'Casamigos Blanco';

SELECT Description, Repeticiones
FROM (
    SELECT Description, COUNT(*) AS Repeticiones
    FROM [2017PurchasePricesDec_Clean]
    GROUP BY Description
    HAVING COUNT(*) > 1
) AS Subconsulta;

SELECT *
FROM [2017PurchasePricesDec_Clean]
WHERE Description IN (
    SELECT Description
    FROM [2017PurchasePricesDec_Clean]
    GROUP BY Description
    HAVING COUNT(*) > 1
);


------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT*
FROM BegInvFINAL12312016_Clean

SELECT*
FROM EndInvFINAL12312016_Clean

SELECT*
FROM InvoicePurchases12312016_Clean

SELECT*
FROM PurchasesFINAL12312016_Clean
WHERE Description='Clayhouse Syrah Paso Robles'
ORDER BY Store;



SELECT*
FROM SalesFINAL12312016_Clean
WHERE Description='Clayhouse Syrah Paso Robles'
ORDER BY Store;


SELECT DISTINCT PONumber
FROM InvoicePurchases12312016_Clean

-- Contar la cantidad de registros en la tabla
SELECT COUNT(*) AS TotalRegistros
FROM InvoicePurchases12312016_Clean;

-- Contar la cantidad de valores únicos en la columna PONumber
SELECT COUNT(DISTINCT InventoryId) AS ValoresUnicos
FROM PurchasesFINAL12312016_Clean;

SELECT InventoryId, COUNT(*) AS Repeticiones
FROM PurchasesFINAL12312016_Clean
GROUP BY InventoryId
HAVING COUNT(*) > 1;

SELECT PONumber
FROM (
    SELECT PONumber, COUNT(*) OVER (PARTITION BY PONumber) AS Count
    FROM InvoicePurchases12312016_Clean
) AS T
WHERE Count > 1;
-------------------------------------------------------------------------------------------------
--CREAR TABLA DE PROVEEDORES/ VENDEDORES


CREATE TABLE Prov (
    ProveedorID INT,
    NombreProveedor VARCHAR(50),
);

INSERT INTO Prov(ProveedorID,NombreProveedor)
SELECT DISTINCT VendorNumber, VendorName
FROM [2017PurchasePricesDec_Clean];

select*
from Prov
ORDER BY ProveedorID
WHERE ProveedorID=10000;
--order by ProveedorID


SELECT*
FROM [2017PurchasePricesDec_Clean]
WHERE VendorNumber=10000;
--ORDER BY VendorNumber DESC

-------------------------------------------------------------------------------------------------
--CREAR TABLA DE PRODUCTOS

SELECT*
FROM [2017PurchasePricesDec_Clean]
--ORDER BY Description


CREATE TABLE Productos (
    ProductID INT IDENTITY,
    Descripcion VARCHAR(250),
    Size VARCHAR(50),
    PurchasePrice FLOAT
);

INSERT INTO Productos(Descripcion, Size, PurchasePrice)
SELECT DISTINCT Description, Size, PurchasePrice
FROM [2017PurchasePricesDec_Clean];

SELECT*
FROM Productos

-- Contar la cantidad de registros en la tabla PurchasePrices
SELECT COUNT(*) AS TotalRegistros
FROM PurchasesFINAL12312016_Clean;

-- Contar la cantidad de valores únicos en la columna PONumber PurchasePrices
SELECT COUNT(DISTINCT Description) AS ValoresUnicos
FROM PurchasesFINAL12312016_Clean;



-- Contar la cantidad de registros en la tabla PurchasePrices
SELECT COUNT(*) AS TotalRegistros
FROM PurchasesFINAL12312016_Clean;

-- Contar la cantidad de valores únicos en la columna PONumber PurchasePrices
SELECT COUNT (Description) AS ValoresUnicos
FROM PurchasesFINAL12312016_Clean

select*
from SalesFINAL12312016_Clean


select*
from BegInvFINAL12312016_Clean

-- Contar la cantidad de registros en la tabla PurchasePrices
SELECT COUNT(*) AS TotalRegistros
FROM BegInvFINAL12312016_Clean;

-- Contar la cantidad de valores únicos en la columna PONumber PurchasePrices
SELECT COUNT (InventoryId) AS ValoresUnicos
FROM BegInvFINAL12312016_Clean


select*
from InvoicePurchases12312016_Clean

SELECT COUNT(*) AS TotalRegistros
FROM InvoicePurchases12312016_Clean;

-- Contar la cantidad de valores únicos en la columna PONumber PurchasePrices
SELECT COUNT (PONumber) AS ValoresUnicos
FROM InvoicePurchases12312016_Clean

-- Paso 1: Alterar la columna para que no permita valores nulos
ALTER TABLE InvoicePurchases12312016_Clean
ALTER COLUMN PONumber INT NOT NULL;

-- Paso 3: Establecer la restricción de clave primaria
ALTER TABLE InvoicePurchases12312016_Clean
ADD CONSTRAINT PK_PONumber PRIMARY KEY (PONumber);


select*
from InvoicePurchases12312016_Clean

SELECT *
FROM dbo.InvoicePurchases12312016_Clean
WHERE TRY_CAST(PONumber AS INT) IS NULL AND PONumber IS NOT NULL;
