-- Create the database
CREATE DATABASE tenant_hub;

-- Create the user - Provide the password here
CREATE USER tenant_hub WITH PASSWORD '<password>';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE tenant_hub TO tenant_hub;

-- Connect to the new database and grant schema privileges
-- \c tenant_hub

GRANT ALL ON SCHEMA public TO tenant_hub;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO tenant_hub;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO tenant_hub;
