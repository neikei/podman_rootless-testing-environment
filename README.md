# podman_rootless-testing-environment

[podman_rootless](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md) testing environment in a Vagrantbox based on Rocky 9.

## Requirements

- Virtualbox >= 7.0.4
- Vagrant >= 2.3.2
- Vagrant Plugins:
  - vagrant plugin install vagrant-hostmanager
  - vagrant plugin install vagrant-vbguest

## Getting started

1. git clone https://github.com/neikei/podman_rootless-testing-environment.git
2. cd podman_rootless-testing-environment
3. vagrant up
4. ... wait ...
5. vagrant ssh

## Try out podman as vagrant user in an rootless environment

```bash
# Run
podman run -it -v /home/vagrant/volume/:/container/volume:Z --name mycontainer alpine /bin/ash

# Show
podman ps

# Exec
podman exec -it mycontainer /bin/ash

# Container actions
ls -la /container/volume
touch /container/volume/testfile
exit

# Host actions
ls -la /home/vagrant/volume/testfile

# Inspect
podman inspect mycontainer

# Stop
podman stop mycontainer

# Start
podman start mycontainer

# Remove
podman rm mycontainer
```

## SElinux

Some [background](https://unix.stackexchange.com/questions/651198/podman-volume-mounts-when-to-use-the-z-or-z-suffix) about the :Z for volumes.

```bash
[vagrant@localhost ~]$ getenforce
Enforcing
[vagrant@localhost ~]$ getsebool -a | grep container
container_connect_any --> off
container_manage_cgroup --> off
container_use_cephfs --> off
container_use_devices --> off
logrotate_read_inside_containers --> off
```

## Feedback, Issues and Pull-Requests

Feel free to report issues, fork this project and submit pull requests.
