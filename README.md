# cephdeploy 

Nodes need DNS resolution and root should have ssh keys exchanged for passwordless ssh

### Ceph node Preparation steps for RHEL8

```
subscription-manager refresh

subscription-manager attach --pool=POOL_ID

subscription-manager repos --disable=*

subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms

subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms

dnf update

subscription-manager repos --enable=rhceph-5-tools-for-rhel-8-x86_64-rpms

subscription-manager repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms

dnf install cephadm-ansible

cd /usr/share/cephadm-ansible
```
### Create hosts file:

```
ceph1 
ceph2 
ceph3
 
[admin] 
ceph0
```

### pre-flight preparation
```
ansible-playbook -i hosts cephadm-preflight.yml --extra-vars "ceph_origin=rhcs"
```
