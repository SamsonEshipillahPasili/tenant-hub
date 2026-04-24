source .env

# make migrations
uv run python manage.py makemigrations

# migrate
uv run python manage.py migrate

if [ "$DEBUG" = "1" ]; then
    echo "Running in debug mode."
    uv run python manage.py runserver
else
    echo "Running in production mode."
    uv run daphne -b 0.0.0.0 -p 8000 tenant_hub.asgi:application
fi
