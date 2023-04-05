FROM quay.io/argoproj/argocd:v2.6.4
USER root  
COPY helm-wrapper.sh /usr/local/bin/
RUN cd /usr/local/bin && \
    mv helm helm.bin && \
    mv helm-wrapper.sh helm && \
    chmod +x helm helm.bin