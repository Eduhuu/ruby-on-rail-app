# Proyecto desarrollado con Ruby on rails
## Seguir los siguientes pasos para instalar correctamente el proyecto:

Instalamos un manejador de versiones de Ruby:

    sudo apt-get install software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt-get install rvm

Se agrega rvm al grupo de usuarios:
    
    sudo usermod -a -G rvm $USER

Si se presenta el error de ```Command not found```

    echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc

Reinicie el equipo.

Luego instalamos la version de ruby que dice el Gemfile

    rvm install "ruby-3.3.0"

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

Para hacer el setup del proyecto debemos crear la base de datos que utilizara la aplicacion.

- Utilizamos el usuario 'postgres' con el comando en la terminal:

    ```
    sudo -i -u postgres
    ```

- Ejecutamos postgres con el comando:

    ```
    psql
    ```

- Creamos el usuario 'root'

    ```
    CREATEUSER root;
    ```

- Para cambiar la contrasena utilizamos:
    
    ```
    ALTER USER root WITH PASSWORD 'postgres';
    ```

- Le damos los siguientes permisos:

    ```
    ALTER USER username WITH LOGIN;
    ALTER USER username CREATEDB;
    ```

- Nos salimos de la base de datos con: 
    
    ```
    \q
    ```

- Nos salimos de el usuario postgres

    ```
    exit
    ```

- Creamos la base de datos con:

    ```
    bin/rails db:create
    ```

- Corremos un set up que trae rails para ver si todo quedo instalado correctamente:

    ```
    bin/setup
    ```

- Corremos las migraciones:

    ```
    rake db:migrate
    ```

- Por ultimo tenemos que instalar ```tailwind``` para ello:

    ```
    ./bin/rails tailwindcss:install
    ```


### Ejecutamos el proyecto con:

    rails s

