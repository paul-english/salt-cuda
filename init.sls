# CUDA 5 tested on Ubuntu 12.04

cuda_prereqs:
  pkg.installed:
    - names:
      - freeglut3-dev
      - build-essential
      - libx11-dev
      - libxmu-dev
      - libxi-dev
      - libgl1-mesa-glx
      - libglu1-mesa
      - libglu1-mesa-dev
      - libglapi-mesa

cuda_blacklist_file:
  file.managed:
    - name: /etc/modprobe.d/blacklist-cuda.conf
    - source: salt://cuda/blacklist-cuda.conf

remove_residual_nvidia_packages:
  cmd.run:
    - name: apt-get remove --purge nvidia*
    - require:
      - file: cuda_blacklist_file
      - pkg: cuda_prereqs

nvidia_installer_file:
  file.managed:
    - name: /root/NVIDIA-Linux-x86_64-319.32.run
    - source: http://us.download.nvidia.com/XFree86/Linux-x86_64/319.32/NVIDIA-Linux-x86_64-319.32.run
    - source_hash: md5=608767a3e1bee8a030f31cdc9251182e
    - mode: 755
    - require:
      - cmd: remove_residual_nvidia_packages

turn_off_lightdm:
  cmd.run:
    - name: service stop lightdm

run_nvidia_installer:
  cmd.run:
    - name: ./NVIDIA-Linux-x86_64-319.32.run -a --update

cuda_toolkit_installer_file:
  file.managed:
    - name: /root/cuda_5.0.35_linux_64_ubuntu11.10-1.run
    - source: http://developer.download.nvidia.com/compute/cuda/5_0/rel-update-1/installers/cuda_5.0.35_linux_64_ubuntu11.10-1.run
    - source_hash: md5=6bfefb8c23d97f657597a6b5678ca047
    - mode: 755
    - require:
      - cmd: remove_redisual_nvidia_packages
