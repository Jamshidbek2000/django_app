# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory to /app
WORKDIR /app

# Create and activate a virtual environment inside the /studybud folder
RUN python -m venv /app/project/studybud/env
ENV PATH="/app/project/studybud/env/bin:$PATH"

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the port that Django will run on (default is 8000)
EXPOSE 8000

# Start with an empty CMD, you can override this in docker-compose or when running the container
CMD ["tail", "-f", "/dev/null"]
