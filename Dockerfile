# ------------------------------------------------------------------------------
# https://www.gnu.org/software/gnump3d/
# ------------------------------------------------------------------------------
# Pull base image
FROM alpine:3.6
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV PKGURL http://savannah.gnu.org/download/gnump3d/gnump3d-3.0.tar.bz2

# ------------------------------------------------------------------------------
# Install gnump3d and clean up
RUN apk --update add perl wget make && \
    cd /tmp && wget $PKGURL && \
    tar xf gnump3d-*.tar.* && rm gnump3d-*.tar.* && \
    cd /tmp/gnump3d-* && make install && cd && \
    sed -e 's@/home/mp3@/media@' -i /etc/gnump3d/gnump3d.conf && \
    sed -e 's@/var/cache/gnump3d@/cache@g' -i /etc/gnump3d/gnump3d.conf && \
    sed -e 's@/var/log/gnump3d@/log@g' -i /etc/gnump3d/gnump3d.conf && \
    apk del wget make && rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# ------------------------------------------------------------------------------
# Install launcher script
COPY app.sh /app/

# ------------------------------------------------------------------------------
# Add volumes
VOLUME /log
VOLUME /cache
VOLUME /media

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 8888

# ------------------------------------------------------------------------------
# Launch gnump3d
CMD ["/app/app.sh"]
