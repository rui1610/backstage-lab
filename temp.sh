# Add the defined environment variables to the bash profile (POSTGRES_HOST, POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_PORT)
set -o allexport
source config/secrets/postgres.env
source config/app.env
set +o allexport

yq -i -y ".app.title = \"${APP_TITLE}\""  $APP_NAME/app-config.yaml
yq -i -y ".organization.name = \"${ORGANIZATION_NAME}\""  $APP_NAME/app-config.yaml

# Change the database client to postgres
yq -i -y ".backend.database.client = \"pg\""  $APP_NAME/app-config.yaml

# Clean up the database connection object
yq -i -y 'del(.backend.database.connection)'  $APP_NAME/app-config.yaml

# Setup the database connection object
yq -i -y '.backend.database.connection.host     = "${POSTGRES_HOST}"'     $APP_NAME/app-config.yaml
yq -i -y '.backend.database.connection.port     = "${POSTGRES_PORT}"'     $APP_NAME/app-config.yaml
yq -i -y '.backend.database.connection.user     = "${POSTGRES_USER}"'     $APP_NAME/app-config.yaml
yq -i -y '.backend.database.connection.password = "${POSTGRES_PASSWORD}"' $APP_NAME/app-config.yaml
