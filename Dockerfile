FROM debian:10

ENV SSM_ACTIVATION_CODE=activationcode
ENV SSM_ACTIVATION_ID=activationid
ENV SSM_REGION=eu-west-1

COPY docker-entrypoint.sh /usr/local/bin/

RUN apt-get -yq update && apt-get -yq install curl && \
   curl "https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb" -o "/tmp/amazon-ssm-agent.deb" &&\
   dpkg -i /tmp/amazon-ssm-agent.deb &&\
   apt-get -yq purge curl && apt-get autoremove --purge -y && apt-get clean &&\
   rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
   ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["amazon-ssm-agent"]
