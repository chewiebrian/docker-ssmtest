# docker-ssmtest
Container for testing AWS SSM agent deployment

# Usage
Example: this starts a Debian Buster container that registers itself on specified SSM Region using Amazon SSM agent.
```
docker run -d --rm 
    -e SSM_REGION=<your SSM region>
    -e SSM_ACTIVATION_CODE=<your hybrid instance activation code> 
    -e SSM_ACTIVATION_ID=<your hybrid instance activation id> 
    chewiebrian/docker-ssmtest
```
