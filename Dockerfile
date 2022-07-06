# base image
FROM alpine

# install dependencies
RUN apk update
RUN apk add --no-cache --upgrade bash
RUN apk add --no-cache --upgrade borgbackup

# update Timezone
RUN apk add --update tzdata
ENV TZ=Europe/Berlin
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime
RUN rm -rf /var/cache/apk/*

# set working directory
WORKDIR /app/
COPY . /app/

CMD ["borgbackup" "--version"]
