{ lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ virt-manager spice-gtk swtpm ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;

    vmVariant = {
      virtualisation = {
        memorySize = 16736;
        cores = 8;
        useNixStoreImage = true;
        writableStore = true;
      };

      virtualisation.qemu.options = [
        "-device virtio-vga-gl"
        "-display gtk,gl=on"
        "-audio pa,model=hda"
      ];

      environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
      };

      services.interception-tools.enable = lib.mkForce false;

    };
  };

  services = {
    spice-autorandr.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };

}
