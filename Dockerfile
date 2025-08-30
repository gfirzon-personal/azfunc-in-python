# Use the official Azure Functions Python runtime as base image
#FROM mcr.microsoft.com/azure-functions/python:4-python3.11
FROM mcr.microsoft.com/azure-functions/python:4-python3.13

# Set environment variables
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

# Copy requirements and install Python dependencies
COPY requirements.txt /
RUN pip install -r /requirements.txt

# Copy configuration files
COPY host.json /home/site/wwwroot/
#COPY local.settings.json /home/site/wwwroot/

# Copy function app code
# COPY . /home/site/wwwroot
COPY function_app/ /home/site/wwwroot

# Set the working directory
WORKDIR /home/site/wwwroot

# Optional: Expose port for local development
EXPOSE 80

# Start the Functions host
#CMD ["func", "start", "--host", "0.0.0.0", "--port", "80"]