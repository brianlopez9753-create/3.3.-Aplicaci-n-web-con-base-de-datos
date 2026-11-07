# Registros

Aplicación Rails para consultar, crear, editar y eliminar registros con nombre,
correo electrónico, teléfono y observaciones.

## Desarrollo local

Requiere Ruby 3.4.12. En desarrollo y pruebas se usa SQLite:

```sh
bin/setup
bin/rails db:migrate
bin/rails server
```

Abre <http://localhost:3000>.

## Despliegue en Render

1. Crea una base de datos PostgreSQL y un servicio web Ruby en Render.
2. Configura `DATABASE_URL` en el servicio web con el valor **Internal Database URL** de la base de datos.
3. Usa `render-build.sh` como **Build Command** y `bundle exec puma -C config/puma.rb` como **Start Command**.
4. Configura `bundle exec rails db:prepare` como **Pre-Deploy Command** para preparar y migrar la base de datos antes de publicar la versión nueva.
5. Configura `RAILS_MASTER_KEY` como variable de entorno si Render no la proporciona desde el archivo de credenciales.

El archivo de build instala las gemas y compila los assets; las migraciones se ejecutan
en el pre-deploy con acceso a la base de datos.
