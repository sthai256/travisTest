#FROM cirrusci/flutter:base

ENV FLUTTER_HOME ${HOME}/sdks/flutter
ENV FLUTTER_VERSION 0.1.1

RUN git clone --branch v${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME}

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

# doctor
RUN flutter doctor

CMD ["flutter", "drive", "./test_driver/simple.dart"]
