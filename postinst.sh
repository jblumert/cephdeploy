#!/bin/bash
# Create and enable a new RDB block pool.
ceph osd pool create rbdpool 32 32
ceph osd pool application enable rbdpool rbd

# Create the CephFS volume.
ceph fs volume create cephfs
