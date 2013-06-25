## CUDA 5 for Ubuntu 12.04

This will prepare an instance for installing both the NVIDIA drivers, and the CUDA toolkit.

Due to the nature of the NVIDIA installers, it can't complete the installation. Run the following in a non-gui environment (ctrl+f1) to fully install.

    sudo -hiu root
    service lightdm stop
    ./NVIDIA-Linux-x86_64-319.32.run
    ./cuda_5.0.35_linux_64_ubuntu11.10-1.run
    reboot
