# Proyecto desarrollado con Ruby on rails
## Seguir los siguientes pasos para instalar correctamente el proyecto:

### Debemos tener instalados Ruby on rails

Instalamos un manejador de versiones de Ruby:

    sudo apt-get install software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt-get install rvm

Se agrega rvm al grupo de usuarios:
    
    sudo usermod -a -G rvm $USER

Si se presenta el error de ```Command not found```

    echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc

Reinicie

Luego instalamos la version de ruby que dice el Gemfile

    rvm install ruby-3.3.0"

Inslatamos Ruby on rails:

    gem install rails

Instalamos las gemas:

    sudo apt install libpq-dev
    bundle install --gemfile /home/ubuntu/ruby-on-rail-app/Gemfile

## Pasos a seguir para instalar postgres:
### Instalar postgres:
    sudo apt install postgresql

### Compruebe que el servidor de postgres esta corriendo con:
    pg_lsclusters
Si no esta corriendo reinicie postgres con: 
    
    sudo service postgresql restart

### El proyecto utiliza una base de datos con las siguientes caracteristicas:
```
user: 'postgres',
host: 'localhost',
database: 'laravel_db',
password: 'postgres',
port: 5432
```

Por lo que debemos cambiar las credenciades del usuarios postgres

- Utilizamos el usuario 'postgres' con el comando en la terminal:

    ```
    sudo -i -u postgres
    ```

- Para crear la nueva base de datos utilizamos:

    ```
    createdb laravel_db
    ```

- Ejecutamos postgres con el comando:

    ```
    psql
    ```

- Para cambiar la contrasena utilizamos:
    
    ```
    ALTER USER postgres WITH PASSWORD 'postgres';
    ```

- Nos salimos de la base de datos con: 
    
    ```
    exit
    ```

- Por ultimo queda crear las migraciones:

### Ejecutamos el proyecto con:

    php artisan serve --host=0.0.0.0 --port=8000

