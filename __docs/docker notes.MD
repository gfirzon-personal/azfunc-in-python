# Build the Docker image
docker build -t my-python-func-app . 

# Run the container
docker run --rm --name my-python-func-container -p 8080:80 my-python-func-app

# Run with environment variables
docker run -p 8080:80 -e AzureWebJobsStorage="UseDevelopmentStorage=true" my-python-func-app