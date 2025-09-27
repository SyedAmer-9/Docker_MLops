# Use an official lightweight Python image as the base image.
# '3.8-slim' specifies Python version 3.8 with a minimal set of packages.
FROM python:3.8-slim

# Set the working directory inside the container to /app.
# This is where subsequent commands will be executed.
WORKDIR /app

# Copy the contents of the current local directory (.) into the container's
# working directory (/app).
COPY . /app

# Run the pip install command to install the Python dependencies.
# -r requirements.txt tells pip to install all packages listed in that file.
# --no-cache-dir keeps the image size smaller by not storing the download cache.
RUN pip install --no-cache-dir -r requirements.txt

# Inform Docker that the container listens on port 5001 at runtime.
# Note: This is just metadata. You still need to publish the port with 'docker run -p'.
EXPOSE 5001

# Set the environment variable FLASK_APP to 'app.py'.
# The 'flask' command uses this to know which file to run.
ENV FLASK_APP=app.py 

# Specify the default command to run when the container starts.
# This command starts the Flask development server.
# '--host=0.0.0.0' makes the server accessible from outside the container.
CMD [ "flask", "run", "--host=0.0.0.0", "--port=5001"]