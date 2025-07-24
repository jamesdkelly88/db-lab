---
tags:
  - key-value
---
# etcd

[:fontawesome-solid-globe: Project Homepage](https://etcd.io/)

[:simple-git: Repository](https://github.com/etcd-io/etcd)

[:simple-docker: Container Registry](https://quay.io/repository/coreos/etcd?tab=tags&tag=latest)

[:material-database: DBDB.io](https://dbdb.io/db/etcd)

etcd is a strongly consistent, distributed key-value store that provides a reliable way to store data that needs to be accessed by a distributed system or cluster of machines. It gracefully handles leader elections during network partitions and can tolerate machine failure, even in the leader node.

The v3 api can be used directly, or via the command line tool etcdctl - remember to set ETCDCTL_API=3

## GUI

- [etcd browser](../etcd-browser)

## Images
| Image | Tag |
| --- | --- |
| quay.io/coreos/etcd | v3.5.21 |

## Ports
- 2379


