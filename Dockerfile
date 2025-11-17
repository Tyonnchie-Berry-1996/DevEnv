FROM fedora:latest

ENV PIP_ROOT_USER_ACTION=ignore
ENV KRB5CCNAME=FILE:/etc/krb5.conf.d/kcm_default_ccache

RUN rm -f /etc/krb5.conf
COPY krb5.conf /etc

RUN dnf -y install ansible-playbook

COPY playbook.yaml /

COPY python-setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/python-setup.sh

ENTRYPOINT ["python-setup.sh"]
