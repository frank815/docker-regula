FROM alpine:latest

ARG TF_VERSION=0.12.29
ARG REGULA_VERSION=0.5.0

RUN apk update \
	&& apk upgrade \
	&& apk add python3 py3-pip graphviz \
	bash

RUN cd \
	&& wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
	&& unzip terraform_${TF_VERSION}_linux_amd64 \
	&& mv terraform /usr/local/bin/ \
    && wget https://github.com/fugue/regula/archive/v${REGULA_VERSION}.zip \
    && unzip v${REGULA_VERSION}.zip \  
    && mv regula-${REGULA_VERSION}/bin/regula /usr/local/bin/ \
    && wget https://openpolicyagent.org/downloads/latest/opa_linux_amd64 \
    && mv opa_linux_amd64 opa \
    && chmod 755 opa \
    && mv opa /usr/local/bin/ \
    && rm *.zip