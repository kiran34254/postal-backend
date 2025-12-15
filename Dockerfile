FROM openshift/python:3.12-minimal-ubi9

ARG CodeBinary

WORKDIR /opt/postal

RUN curl -L ${CodeBinary} -o postal-backend && \
    chmod +x postal-backend

EXPOSE 8080

CMD ["./postal-backend"]
