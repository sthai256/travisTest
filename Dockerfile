FROM  tracer0tong/android-emulator

ENV FLUTTER_HOME ${HOME}/sdks/flutter
ENV FLUTTER_VERSION 0.1.1

RUN git clone --branch v${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME}

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# doctor
RUN flutter doctor

#CMD ["flutter", "drive", "./test_driver/simple.dart"]
