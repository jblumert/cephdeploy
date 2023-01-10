# cephdeploy 

# Ceph node Preparation steps for RHEL8

subscription-manager refresh
subscription-manager attach --pool=POOL_ID
subscription-manager repos --disable=*
subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
dnf update
subscription-manager repos --enable=rhceph-5-tools-for-rhel-8-x86_64-rpms
subscription-manager repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms
dnf install cephadm-ansible
