#Base dev Image
FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y install npm git \
  python-dev python-virtualenv libffi-dev

#Load Horizon Base
RUN mkdir /opt/stack

WORKDIR /opt/stack

RUN git clone https://github.com/openstack/horizon.git

WORKDIR /opt/stack/horizon

RUN git checkout stable/juno

RUN ./run_tests.sh -V

ADD local_settings.py opt/stack/horizon/openstack_dashboard/local/local_settings.py

#ENTRYPOINT ["/horizon/run_tests.sh", "--runserver", "0.0.0.0:8000"] 
