# vcenter-test-container
vCenter simulator container for testing.

## Usage ##

### Building the image locally ###

```bash
docker image build -t local/ansible/vcenter-test-container:latest .
```

### Building the image locally with a different version of govmomi checked out ###

```bash
docker image build --build-arg GOVMOMI_CHECKOUT=<hash|branch|tag> -t local/ansible/vcenter-test-container:<hash|branch|tag> .
```
