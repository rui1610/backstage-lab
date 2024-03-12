# Add the defined environment variables to the bash profile (POSTGRES_HOST, POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_PORT)
set -o allexport
source config/secrets/postgres.env
set +o allexport

npx --yes @backstage/create-app@latest 

# Checkout https://backstage.io/docs/getting-started/ for starting the app by changing to the app directory and running the following command
# cd my-app
# yarn dev

