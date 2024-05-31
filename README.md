# Expansión Online de tiendas TopDrinks

<h1>El Proyecto</h1>   

<h2>La empresa </h2>  

TopDrinks es una compañia que se enfoca en la compra y venta de bebidas alcohólicas y destilados. Con al rededor de 80 tiendas en el país, tiene una posición sólida en el mercado del gracias a que su puntos fisicos son bastante conocidos. Sin embargo, para mantener y aumentar su competitividad en un mundo cada vez más digitalizado, es crucial que la compañía se expanda al mercado en línea.

<h2>El Desafio </h2>   

La empresa se enfrenta al desafío de mantener su competitividad en un entorno comercial cada vez más digitalizado. Aunque ha tenido éxito en el mercado físico, la falta de conocimiento sobre la gestión de inventarios representa un obstáculo significativo para su expansión, este desconocimiento radica en que la información se encuentra almacenada en diferentes archivos de Excel y no hay una unanimidad de los datos. 
Sin una comprensión detallada de sus existencias y de cómo gestionarlas eficientemente, la empresa podría experimentar problemas de logística, exceso o escasez de productos y, finalmente, perdida de ventas.

<h2>Objetivos</h2> 

1.	identificar ubicaciones estratégicas en las cuales se puede iniciar el modelo de compra y venta online 
2.	Identificar los productos que más rotación presentan para que generen más ventas, y, a su vez, los productos que menos rotación tienen para asi iniciar campañas de promocionamiento de dichos productos, y lograr un aumento de ventas, o por el contrario, determinar si continúan en el catalogo de productos de la compañía
3.	Generar un dashboard interactivo el cual permitirá que el cliente haga un seguimiento preciso y en tiempo real de su inventario, optimizando así la disponibilidad de productos.

<h1>El Proceso</h1>   

<h3>ETL<h3><h3>

-	El proceso inició con la descarga de los archivos en formato .csv enviados por el cliente y posterior almacenamiento de los mismos en Google Drive
-	Para conocer los datos, realizamos una primera carga de datos en Python. Con la librería Pandas empezamos la limpieza y normalización de datos, llenando datos nulos, corrigiendo formatos y tipos de datos.
-	Con los datos limpios, se cargaron los nuevos archivos .csv a SQL Server e iniciamos el EDA
-	Verificación de valores únicos en las columnas para determinar claves primarias y claves foráneas y así poder establecer el flujo de información para la base de datos.

  ![image](https://github.com/camluna/Top-Drinks-Final-Project/assets/145697449/3c3ae7b8-02a0-44dd-aef8-ce9665017f18)
  
- Verificación de columnas con valores únicos

  ![image](https://github.com/camluna/Top-Drinks-Final-Project/assets/145697449/91512a53-0410-45fe-bf70-2ed360814d01)

- Normalización de columnas en todas las tablas: cambios de formato y cambios de tipo de dato para poder realizar operaciones entre estas

  ![image](https://github.com/camluna/Top-Drinks-Final-Project/assets/145697449/ecc6f465-df64-4544-a4b0-5784fefb4df8)


<h3>Automatización de carga de datos<h3><h3>
  
De manera simultánea, se desarrolló un proceso de carga y limpieza de datos automático, que funciona de la siguiente manera: 

- Conexión de la base de datos a Google Drive: El cliente hace usos de las tablas en excel y  modifica los registros
  
- El programa, al momento de identificar que hay registros nuevos, realiza una descarga de estos archivos en una carpeta temporal
  
- Por medio de una función, verifica y limpia los datos, y cuando encuentra inconsistencias, el resultado para el registro será 'No Definido'
  
- De esta manera, el cliente puede identificar visualmente los valores que están haciendo falta para su posterior análisis
  
- Cuando el proceso termina, los archivos se cargan nuevamente a la carpeta de Google Drive
  
*Para consultar el código detrás de esta automatización, haz click aquí https://ln.run/S3C7P 


<h2>Hallazgos </h2> 

1. Inconsistencia en rango de datos: Los datos entregados contienen fechas muy disimiles, por lo cual no es posible hacer un análisis temporal
2. Las ventas se registran solamente por dos meses (Enero y Febrero), las compras desde Enero hasta Junio y las Ordenes de Compra tienen registros desde Enero hasta Diciembre. Esto sugiere que no hay una homogeneidad en los datos
3. No se percibe constancia en las ventas. En Febrero hay una caída abrupta de ventas.


<h2>Resultados</h2> 

