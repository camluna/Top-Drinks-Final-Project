USE TopDrinksDB


SELECT*
FROM PurchasesFINAL12312016_Clean

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
