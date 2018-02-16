FROM brianegan/flutter:v9
#FROM tracer0tong/android-emulator

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Define environment variable
ENV NAME World

CMD ["flutter", "flutter drive”]
