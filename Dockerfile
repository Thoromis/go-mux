FROM golang:1.11-alpine

# Set maintainer label: maintainer=[thomas.lmaier97@gmail.com]
LABEL maintainer='thomas.lmaier97@gmail.com'

# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY Makefile *.go go.* /src/

# List items in the working directory (ls)
RUN ls -laht

# Build the GO app as myapp binary and move it to /usr/
RUN CGO_ENABLED=0 go build -o /usr/gomux

#Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/gomux"]

