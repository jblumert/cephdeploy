#!/bin/bash
echo "cephadm bootstrap --apply-spec spec.yaml --mon-ip 192.168.252.11 --ssh-private-key /root/.ssh/id_rsa --ssh-public-key /root/.ssh/id_rsa.pub --registry-url registry.redhat.io --registry-username blumert --registry-password Washt0ning*1961"
cephadm bootstrap --apply-spec spec.yaml --mon-ip 192.168.252.11 --ssh-private-key /root/.ssh/id_rsa --ssh-public-key /root/.ssh/id_rsa.pub --registry-url registry.redhat.io --registry-username blumert --registry-password Washt0ning*1961

