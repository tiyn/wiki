# Virtualization

## Docker

Docker is a virtualization software that deploys docker containers.
Due to easy handlin and reproducable environments it is a useful tool.

## Enable Nvidia GPUs

To use Nvidia GPUs with docker you need to install the nvidia-cuda-toolkit.
There is a [guide on marmelab](https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html) that focusses on that topic.

## Proxmox

Proxmox Virtual Envoronment is a virtualization software for servers.
It's made for VM and container deployment.

## PCI/GPU passthrough

To use GPUs or other PCI devices you need to work with PCI passthrough.
For documentation you can look in the [Proxmox wiki](https://pve.proxmox.com/wiki/Pci_passthrough).
There is also an [article](https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough) on reddit, that focusses especially on windows 10 VMs with GPU passthrough.
