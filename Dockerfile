#
# Node.js w/ Bower & Grunt runtime Dockerfile
#
# https://github.com/DigitallySeamless/nodejs-bower-grunt-runtime
#

# Pull base image.
FROM library/node

# Install Bower & Grunt
RUN npm install -g bower grunt-cli && \
    echo '{ "allow_root": true }' > /root/.bowerrc

# Set instructions on build.
ONBUILD ADD package.json /app/
ONBUILD RUN npm install

# Define working directory.
WORKDIR /app

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 8080