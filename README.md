# sample-ec2-docker

## usage

create ssh key
```
ssh-keygen -t rsa -f ./id_rsa
```

image build
```
docker build -t al2:latest .
```

container run
```
docker run --rm --privileged --name al2 -p 2222:22 -d al2
```

ssh
```
ssh ec2-user@localhost -i id_rsa -p 2222 -o 'StrictHostKeyChecking no'
```
