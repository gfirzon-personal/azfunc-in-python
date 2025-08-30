# Build the Docker image with no-cache to ensure fresh build
docker build --no-cache -t my-python-func-app .

# Or build normally first
docker build -t my-python-func-app .

# Then prune unused Docker objects
docker system prune -f

# Or for more aggressive cleanup (removes all unused images, not just dangling ones)
docker system prune -a -f

# You can also prune specific resources:
# Remove unused images
docker image prune -f

# Remove unused containers
docker container prune -f

# Remove unused volumes
docker volume prune -f

# Remove unused networks
docker network prune -f