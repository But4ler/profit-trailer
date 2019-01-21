FROM openjdk:8-jre-alpine

#ENV PATH /usr/local/bin:$PATH

ARG PT_VERSION=${PT_VERSION:-2.2.0}
ENV PT_VERSION ${PT_VERSION}

# install tools
RUN apk add --update wget bash
RUN wget https://github.com/taniman/profit-trailer/releases/download/$PT_VERSION/ProfitTrailer-$PT_VERSION.zip -P /opt

COPY entrypoint.sh /

VOLUME ["/app/ProfitTrailer"]

CMD ["/entrypoint.sh"]

EXPOSE 8081
