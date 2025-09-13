Estrategia de Automatización - CRUD Usuarios ServeRest

 🎯 Objetivo

Automatizar las pruebas del CRUD de usuarios en la API ServeRest, garantizando:

Robustez: pruebas confiables que detecten fallos reales.

Legibilidad: scripts claros y fáciles de entender.

Reusabilidad: componentes y helpers reutilizables para acelerar el desarrollo.


🛠️ Patrones y decisiones técnicas
Separación por responsabilidad:
Cada endpoint tiene su propio archivo .feature para facilitar mantenimiento y escalabilidad.

Validación con esquemas JSON externos:
Los esquemas se mantienen en archivos JSON separados para mantener los escenarios limpios y facilitar actualizaciones.

Helpers en JavaScript:
Centralización de funciones para generación dinámica de datos, evitando colisiones y duplicados (ej. emails aleatorios).

Cobertura de casos positivos y negativos:
Se contemplan escenarios de éxito y de error para validar comportamiento esperado y manejo de fallos.

Integración con JUnit5:
Uso de Test Runner para facilitar la ejecución en pipelines CI/CD y generación de reportes.

Uso de datos dinámicos:
Para evitar dependencias entre pruebas y asegurar independencia y repetibilidad.

📋 Cobertura mínima propuesta
Método HTTP	Casos principales

### POST	

- Registrar usuario exitosamente
- Validar al registrar usuario con email duplicado
- Validar al registrar usuario con datos vacios
- Validar al registrar usuario con datos invalidos

###   GET list	

- Validar al obtener lista de usuarios y tenga la estructura correcta
- Validar que la cantidad coincide con el número de usuarios
- Buscar usuarios por nombre y email que existen
- Validar el esquema de los usuarios en la lista
- Validar al buscar usuarios por nombre y email que no existen la cantidad de usuarios

###   GET by id	

- Buscar usuario por ID válido
- Buscar usuario por ID mayor o menor a 16 caracteres
- Buscar usuario por ID inexistente

###   PUT	

- Actualizar usuario existente con datos validos
- Validar que no permita actualizar con datos inválidos
- Validar que no permita actualizar con datos vacios

###   DELETE	

- Eliminar usuario existente
- Validar que no permita eliminar usuario con un carrito registrado