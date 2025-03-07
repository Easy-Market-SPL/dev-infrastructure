
# EasyMarket Dev Infrastructure

Docker compose que permite levantar la infraestructura basica del backend de la SPL EasyMarket para el desarrollo local

---
## Stack Tecnológico 🛠️

![Docker](https://skillicons.dev/icons?i=docker)

---
## Variables de Entorno 🔒

Para ejecutar este proyecto, necesitarás agregar las siguientes variables de entorno a tu archivo .env

* `CONFIG_TOKEN` : Token de acceso a variables de entorno de solo lectura para doppler

* `BACK_TOKEN` : Token de acceso a variables de entorno de solo lectura para doppler


### Configuracion con doppler 🚀

Como requisito para realizar el manejo de variables de entorno con doppler se debe tener instalado el CLI de doppler, para ello se debe seguir la guía de instalación en el siguiente [enlace](https://docs.doppler.com/docs/cli)

Debe ser parte del equipo de doppler para poder acceder a las variables de entorno del proyecto, para ello se debe enviar el correo de la cuenta de doppler al correo de alguno de los miembros del equipo para ser agregado.

Para obtener las variables de entorno del proyecto se debe ejecutar el siguiente comando en la terminal:

**1. Iniciar sesión en doppler**

```bash
doppler login
```

**2. Seleccionar el proyecto (infrastructure) y el ambiente de desarrollo (dev)**

```bash
doppler setup
```
**3. Ejecutar el docker compose con la inyección de variables de entorno de doppler**

```bash
# windows
doppler run -- docker compose up --build -d
```

## Ejecutar Localmente 💻

Clona el proyecto

```bash
  git clone https://github.com/Easy-Market-SPL/dev-infrastructure
```

Ve al directorio del proyecto

```bash
  cd dev-infrastructure
```

Inicia el docker compose

```bash
  doppler run -- docker compose up --build -d
```

---

## Autores 🧑🏻‍💻

- [@Estebans441](https://www.github.com/Estebans441)
