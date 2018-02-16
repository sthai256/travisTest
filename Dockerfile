FROM tracer0tong/android-emulator
CMD ["adb", "devices"]

FROM brianegan/flutter:v9

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Define environment variable
ENV NAME World

CMD ["flutter", "drive", "./test_driver/simple.dart"]
