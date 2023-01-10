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

### create spec.yaml file:
```
service_type: host
addr: ceph1
hostname: ceph1
---
service_type: host
addr: ceph2
hostname: ceph2
---
service_type: host
addr: ceph3
hostname: ceph3
---
service_type: mon
placement:
  host_pattern: "ceph[1-3]"
---
service_type: osd
service_id: my_osds
placement:
  host_pattern: "ceph[1-3]"
data_devices:
  all: true
---
service_type: rgw
service_id: objectgw
service_name: rgw.objectgw
placement:
  host_pattern: "ceph1"
spec:
  rgw_frontend_port: 8080
---
service_type: mds
service_id: cephfs
placement:
  host_pattern: "ceph2"
 ```
 
### bootstrap cluster
```
cephadm bootstrap --apply-spec spec.yaml --mon-ip 192.168.252.11 \ 
    --ssh-private-key /root/.ssh/id_rsa --ssh-public-key /root/.ssh/id_rsa.pub \ 
    --registry-url registry.redhat.io --registry-username <userid> --registry-password <pwd>
```


### Create and enable a new RDB block pool.
```
ceph osd pool create rbdpool 32 32
ceph osd pool application enable rbdpool rbd
```

### Create the CephFS volume.
```
ceph fs volume create cephfs
```
