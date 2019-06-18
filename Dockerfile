FROM amazonlinux:2

RUN yum install -y  \
      sudo \
      shadow-utils \
      procps \
      wget \
      openssh-server \
      openssh-clients

RUN wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python

RUN systemctl enable sshd.service && \
      echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
COPY ./id_rsa.pub /home/ec2-user/.ssh/id_rsa.pub
RUN cat /home/ec2-user/.ssh/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys

RUN useradd ec2-user && \
      echo "ec2-user ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN chown ec2-user:ec2-user /home/ec2-user

CMD /sbin/init
