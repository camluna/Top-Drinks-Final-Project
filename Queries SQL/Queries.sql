USE TopDrinksDB

-----------------------------------REVISIÓN DE LA TABLA PURCHASE PRICES-------------------------------------------------
SELECT*
FROM [2017PurchasePricesDec_Clean]
ORDER BY VendorNumber

-- Contar la cantidad de registros en la tabla PurchasePrices
SELECT COUNT(*) AS TotalRegistros
FROM [2017PurchasePricesDec_Clean];

-- Contar la cantidad de valores únicos en la columna PONumber PurchasePrices
SELECT COUNT(DISTINCT Description) AS ValoresUnicos
FROM [2017PurchasePricesDec_Clean];

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
WHERE ProveedorID=10000;
--order by ProveedorID


SELECT*
FROM [2017PurchasePricesDec_Clean]
WHERE VendorNumber=10000;
--ORDER BY VendorNumber DESC

-------------------------------------------------------------------------------------------------
--CREAR TABLA DE PRODUCTOS



