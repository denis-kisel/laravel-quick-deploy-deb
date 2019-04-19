if [[ $# -eq 0 ]] ; then
    echo 'You need specify site-name'
    exit 1
fi

source /etc/create-laravel-project.conf

DOMAIN=$1$DOMAIN_POSTFIX
APP_PATH=$PUBLIC_HTML$DOMAIN
DB_NAME=${1/'-'/'_'}

composer create-project --prefer-dist laravel/laravel $DOMAIN

cd $APP_PATH && rm .env
cd $APP_PATH && cp /usr/share/create-laravel-project/stubs/env.stub .env
cd $APP_PATH && sed -i "s/{app_name}/$1/g" .env
cd $APP_PATH && sed -i "s/{db_name}/$DB_NAME/g" .env
cd $APP_PATH && sed -i "s/{db_uname}/$DB_USERNAME/g" .env
cd $APP_PATH && sed -i "s/{db_password}/$DB_PASSWORD/g" .env
cd $APP_PATH && sed -i "s/{db_port}/$DB_PORT/g" .env
cd $APP_PATH && sed -i "s/{db_host}/$DB_HOST/g" .env
cd $APP_PATH && sed -i "s/{db_connection}/$DB_CONNECTION/g" .env

mysql -u$DB_USERNAME -p$DB_PASSWORD -e "CREATE DATABASE $DB_NAME /*\!40100 DEFAULT CHARACTER SET utf8 */;"

cd $APP_PATH && composer require encore/laravel-admin
cd $APP_PATH && php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"
cd $APP_PATH && php artisan admin:install

cd $APP_PATH && composer require barryvdh/laravel-ide-helper
cd $APP_PATH && composer require barryvdh/laravel-debugbar --dev

cd $APP_PATH && composer require denis-kisel/laravel-admin-widget
cd $APP_PATH && php artisan vendor:publish --provider="DenisKisel\\LaravelAdminWidget\\LaravelAdminWidgetServiceProvider"

cd $APP_PATH && composer require denis-kisel/summernote
cd $APP_PATH && php artisan vendor:publish --provider="DenisKisel\\Summernote\\SummernoteServiceProvider"

cd $APP_PATH && composer require denis-kisel/repeator
cd $APP_PATH && composer require denis-kisel/laravel-migration-pump
cd $APP_PATH && composer require denis-kisel/laravel-admin-ready-solution

cd $APP_PATH && composer require arrilot/laravel-widgets



cd $APP_PATH && php artisan key:generate

bash /usr/bin/a2-new-site $DOMAIN