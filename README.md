📋 Requisitos
Java 11 o superior
Maven 3.6 o superior


🚀 Cómo ejecutar los tests
Ejecuta los tests con Maven:
mvn clean test
O ejecuta directamente el runner específico (por ejemplo, TestRunner.java) desde tu IDE.



📂 Estructura del proyecto

src/
└── test/
├── java/
│    └── runner/            
└── resources/
     ├── features/          
     ├── helpers/          
     └── schemas/

📊 Resultados
Los reportes de ejecución se generan automáticamente en:
target/karate-reports/

Incluyen reportes HTML con detalles de cada escenario y paso.

📝 Notas importantes
Uso de datos dinámicos para evitar conflictos, especialmente en campos únicos como el email.
Validación de respuestas mediante esquemas JSON externos, lo que mantiene los archivos .feature limpios y fáciles de mantener.
Integración con JUnit5 para facilitar la ejecución y reporte en entornos CI/CD.
