# Base image from OpenShift image stream
FROM openshift/ubi9-micro:latest

# Build-time argument
ARG CodeBinary

# Set working directory
WORKDIR /opt/postal

# Install minimal required tools
RUN microdnf install curl && microdnf clean all

# Download application binary using build ARG
RUN curl -L ${CodeBinary} -o postal-backend && \
    chmod +x postal-backend

# Expose application port (adjust if needed)
EXPOSE 8080

# Run the application
CMD ["./postal-backend"]
