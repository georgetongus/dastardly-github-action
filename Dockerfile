FROM public.ecr.aws/portswigger/dastardly:latest

USER root

COPY root.cer /root.cer

RUN /usr/local/burpsuite_enterprise/jre/bin/keytool -import -noprompt -keystore /usr/local/burpsuite_enterprise/jre/lib/security/cacerts -storepass changeit -alias "msk-root-ca" -file /root.cer \
    && rm /root.cer
