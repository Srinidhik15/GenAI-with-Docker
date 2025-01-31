# Use the official Python 3.10 Image
FROM python:3.10

# Set the working directory to /code
WORKDIR /code

# Copy the current directory content in the container at /code
COPY ./requirements.txt /code/requirements.txt

# Install the requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Set up a new user named "user"
RUN useradd user
# Switch to the "user" user
USER user

# Set the home to the user's home directory
ENV HOME =/home/user \
    PATH=/home/user/.local/bin:$PATH

# Set the working directory to the users home directory
WORKDIR $HOME/app

# Set the working directory contents into the container at $HOME/app setting the owner to user
COPY --chown=user . $HOME/app

# Start FASTAPI app on port 7860
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]

