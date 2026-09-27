# IberiaTech Services: SQL Operations & Profitability Analysis

## 📌 Resumen del Proyecto
Este proyecto simula el entorno de datos de "IberiaTech Services", una empresa B2B de servicios tecnológicos. El objetivo principal es construir una base de datos relacional desde cero y utilizar SQL analítico para auditar la rentabilidad de los proyectos, la eficiencia operativa y su impacto en la satisfacción del cliente (CSAT).

A través del análisis de datos, se identificaron fugas de capital y cuellos de botella operativos que afectaban el margen de beneficio neto de la compañía.

## 🏗️ Arquitectura y Tecnologías
* **Motor de Base de Datos:** SQLite (compatible con sintaxis PostgreSQL).
* **Entorno de Desarrollo:** Visual Studio Code (extensión SQLite).
* **Diseño del Esquema:** Arquitectura de 11 tablas (Dimensiones y Hechos) modelando departamentos, empleados, clientes, proyectos, horas trabajadas, facturación y tickets de soporte.
* **Calidad de Datos (Data Governance):** Implementación de DDL robusto con restricciones `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE` y reglas `CHECK` para garantizar la integridad operativa (ej. bloquear inputs de horas imposibles o encuestas fuera de rango).
* **Técnicas Analíticas SQL:** `INNER JOIN`, `LEFT JOIN`, Agregaciones (`SUM`, `COUNT`), Cálculos Aritméticos dinámicos, y Expresiones de Tabla Comunes (CTEs).

## 📊 Caso de Negocio: El Problema "Beta Pharma"
El análisis de rentabilidad (Profitability Analysis) cruzó los ingresos facturados con los costes laborales reales basados en las horas invertidas (Timesheets) por perfil técnico. 

**Hallazgos Clave:**
1. **Destrucción de Margen:** El proyecto "Pharma CRM v2" para el cliente Beta Pharma generó ingresos por 60.000 €, pero consumió 69.500 € en costes laborales, resultando en una pérdida neta de **-9.500 €**.
2. **Causa Raíz Operativa:** Mediante el uso de CTEs para analizar los tiempos de resolución, se descubrió que el equipo de soporte tardó **15 días** en resolver un ticket catalogado como "Critical".
3. **Impacto en el Cliente:** La deficiencia técnica y los retrasos forzaron horas extras excesivas (destruyendo la rentabilidad) y resultaron en una puntuación de satisfacción del cliente de **4 sobre 10**.

Frente a esto, el análisis también identificó a clientes como *Alpha Logistics*, con un margen neto de +32.000 € y un CSAT de 9/10, validando el modelo de negocio cuando la ejecución operativa es correcta.

## 📁 Estructura del Repositorio
* `/database`
  * `01_create_tables.sql`: Script DDL con la estructura completa y data constraints.
  * `02_insert_data.sql`: Script DML con la inyección de datos estructurados para simular el entorno operativo.
* `/queries`
  * `01_business_overview.sql`: Consultas de exploración y carga de trabajo.
  * `02_profitability_analysis.sql`: Cálculo de costes laborales y margen de beneficio mediante JOINs.
  * `03_customer_experience.sql`: Cruce de variables de rendimiento y satisfacción.
  * `04_support_performance.sql`: Análisis de tiempos de resolución de incidencias utilizando CTEs y manipulación de fechas.