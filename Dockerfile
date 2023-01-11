FROM maven:3.8.6-openjdk-8

RUN apt-get update && apt-get install -y zip curl
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
	&& apt-get update -qqy \
	&& apt-get -qqy install google-chrome-stable \
	&& rm /etc/apt/sources.list.d/google-chrome.list \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
	&& sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome

RUN echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list.d/debian.list \
        && apt-get update \
        && apt-get install -y --no-install-recommends firefox

WORKDIR /app/mnt/
ADD src /app/mnt/src
ADD testng.xml /app/mnt/testng.xml
ADD pom.xml /app/mnt/pom.xml

RUN ["mvn", "clean","test"]