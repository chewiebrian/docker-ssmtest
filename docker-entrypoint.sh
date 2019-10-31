#!/bin/bash

if [ ! -f /var/lib/amazon/ssm/registration ]; then
  echo "Registering container into SSM (region $SSM_REGION)"
  amazon-ssm-agent -register -code $SSM_ACTIVATION_CODE -id $SSM_ACTIVATION_ID -region $SSM_REGION
fi

exec "$@"
