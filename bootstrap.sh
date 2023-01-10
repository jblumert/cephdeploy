#!/bin/bash
echo "cephadm bootstrap --apply-spec spec.yaml --mon-ip 192.168.252.11 --ssh-private-key /root/.ssh/id_rsa --ssh-public-key /root/.ssh/id_rsa.pub --registry-url registry.redhat.io --registry-username <userid> --registry-password <pwd>"
cephadm bootstrap --apply-spec spec.yaml --mon-ip 192.168.252.11 --ssh-private-key /root/.ssh/id_rsa --ssh-public-key /root/.ssh/id_rsa.pub --registry-url registry.redhat.io --registry-username <userid> --registry-password <pwd>

