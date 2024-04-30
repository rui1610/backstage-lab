set -o allexport
# Add the defined environment variables to the bash profile (POSTGRES_HOST, POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_PORT)
source config/secrets/postgres.env
# Add the defined environment variables to the bash profile (APP_TITLE, ORGANIZATION_NAME)cle
source config/app.env
set +o allexport

npx --yes @backstage/create-app@latest 

# Setup environment variables
# ---------------------------------------------------------------
# Checkout https://backstage.io/docs/getting-started/ for starting the app by changing to the app directory and running the following command
# Change "btprui" to the name of the app you want to create (entered in the previous step)
yq -i -y ".app.title = \"${APP_TITLE}\""  $APP_NAME/app-config.yaml
yq -i -y ".organization.name = \"${ORGANIZATION_NAME}\""  $APP_NAME/app-config.yaml
# ---------------------------------------------------------------
# Checkout https://backstage.io/docs/tutorials/switching-sqlite-postgres/ for setting up the database connection
# ---------------------------------------------------------------
# Change the database client to postgres
yq -i -y ".backend.database.client = \"pg\""  $APP_NAME/app-config.yaml
# Clean up the database connection object
yq -i -y 'del(.backend.database.connection)'  $APP_NAME/app-config.yaml
# Setup the database connection object
yq -i -y '.backend.database.connection.host     = "${POSTGRES_HOST}"'     $APP_NAME/app-config.yaml
yq -i -y '.backend.database.connection.port     = "${POSTGRES_PORT}"'     $APP_NAME/app-config.yaml
yq -i -y '.backend.database.connection.user     = "${POSTGRES_USER}"'     $APP_NAME/app-config.yaml
yq -i -y '.backend.database.connection.password = "${POSTGRES_PASSWORD}"' $APP_NAME/app-config.yaml

cd $APP_NAME

# add PostgreSQL to the backend
yarn --cwd packages/backend add pg
yarn dev
