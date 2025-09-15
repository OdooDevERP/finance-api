# 1. Setting Up An Official RunTime Environment As A Parent Image
FROM python:3.12.10-slim

# 2. Creating the Working Directory Inside the Container
WORKDIR /app

# 3. Updating "pip" Package
RUN python -m pip install --upgrade pip

# 4. Copying the "requirements.txt" File Into the Working Directory At First
#    To Increase Building Speed of the Docker Image
COPY ./requirements.txt .

# 5. Installing the Packages (If Needed)
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

# 6. Copying the Rest of the Application Into the Working Directory
COPY . .

# 7. Exposing A PORT Number for Running the Application
EXPOSE 3031

# 8. Running the Application
# CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "3031"]
CMD ["fastapi", "dev", "src", "--host", "0.0.0.0", "--port", "3030"]
