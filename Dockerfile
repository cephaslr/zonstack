FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y install npm git \
  python-dev python-virtualenv libffi-dev

RUN git clone https://github.com/openstack/horizon.git

ADD local_settings.py /horizon/openstack_dashboard/local/local_settings.py

WORKDIR /horizon

RUN ./run_tests.sh -V

EXPOSE 8000

ENTRYPOINT ["/horizon/run_tests.sh", "--runserver", "0.0.0.0:8000"]
