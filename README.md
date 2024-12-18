# LISTA DE COMPRA

## Descripción General

**Lista de Compra** es una aplicación básica diseñada para gestionar productos y carritos de compra. Desarrollada con el framework multiplataforma **Flutter**, está optimizada para dispositivos Android, aunque puede ejecutarse en otras plataformas compatibles con Flutter. 

El proyecto se creó utilizando el comando `flutter create` de la CLI de Flutter y se desarrolló en el entorno de desarrollo integrado (IDE) **Android Studio**. 

Para una presentación detallada de las funcionalidades de la aplicación, consulta el siguiente vídeo:  
[**Lista de Compra - Vídeo Demo**](https://youtu.be/EaOgrd_TK3Q)

> [!NOTE]
> La aplicación ha sido probada exitosamente en un dispositivo **Pixel 6 con API 35 (Google APIs)**.

---

## Configuración del Proyecto

Las siguientes herramientas y tecnologías fueron utilizadas durante el desarrollo:

- **IDE:** Android Studio `Ladybug`
- **Framework:** Flutter
- **Lenguaje:** Dart
- **SDK:** Android `API 25`

---

## Funcionalidades Principales

La aplicación proporciona una experiencia intuitiva para gestionar una lista de compra, con características que van desde el inicio de sesión hasta la manipulación del carrito. A continuación, se describen las funcionalidades clave:

### 1. Inicio de Sesión
- Validación de correo electrónico y contraseña.
- Verificación de usuario existente.
- Mensajes de error informativos para una mejor experiencia del usuario.

### 2. Lista de Productos
- Selección de productos para añadir al carrito.
- Barra de herramientas para ordenar productos.
- Diálogo que informa si el carrito está vacío.
- Adaptación automática para vistas en orientación horizontal.

### 3. Detalle del Producto
- Información detallada de cada producto.
- Diseño optimizado para vistas en orientación horizontal.

### 4. Carrito de Compra
- Selección de unidades para cada producto, con un mínimo de 1 unidad.
- Cálculo automático del precio total.
- Restablecimiento de unidades al deseleccionar productos.

---

## Detalles Técnicos

Para mejorar la interacción del usuario y gestionar posibles errores, se han implementado las siguientes estrategias:

- Uso de `SnackBars` para mostrar mensajes contextuales.
- Mensajes de error en texto rojo bajo los campos `TextField` relevantes.
- Ventanas emergentes informativas mediante `AlertDialogs`.

Además, se utilizó el widget `ListView` para la visualización de la lista de productos, adaptado para simular la disposición de un `GridView`.

---

## Recursos Adicionales

Si deseas profundizar más en las capacidades y estructura de la aplicación, consulta la [**demo en vídeo**](https://youtu.be/EaOgrd_TK3Q). Este recurso incluye una explicación detallada de las funciones implementadas y su propósito.