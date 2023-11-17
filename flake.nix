{
  inputs = {
    nixpkgs.url = "github:NickCao/nixpkgs/riscv";
    nixos-hardware.url = "github:NickCao/nixos-hardware";
  };
  outputs = { self, nixpkgs, nixos-hardware }: {
    hydraJobs = with self.nixosConfigurations.qemu;
      let vf2 = pkgs.callPackage "${nixos-hardware}/starfive/visionfive/v2/firmware.nix" { }; in {
        visionfive2 = self.nixosConfigurations.visionfive2.config.system.build.sdImage;
        inherit (pkgs)
          qemu
          opensbi
          firefox-unwrapped
          thunderbird-unwrapped
          ;
        qt5 = {
          inherit (pkgs.qt5)
            qtbase qt3d qtcharts qtconnectivity qtdeclarative qtdoc qtgraphicaleffects
            qtimageformats qtlocation qtmultimedia qtquickcontrols qtquickcontrols2
            qtscript qtsensors qtserialport qtsvg qttools qtvirtualkeyboard
            qtwebchannel qtwebengine qtwebsockets qtwebview qtx11extras qtxmlpatterns
            qtlottie qtdatavis3d qtwayland;
        };
        spl-vf2 = vf2.spl;
        uboot-fit-image-vf2 = vf2.uboot-fit-image;
        edk2-vf2 = pkgs.pkgsCross.riscv64-embedded.callPackage ./edk2-vf2.nix { };
      };
    nixosConfigurations = {
      qemu = nixpkgs.lib.nixosSystem {
        modules = [
          ./common.nix
          ./qemu.nix
        ];
      };
      visionfive2 = nixpkgs.lib.nixosSystem {
        modules = [
          "${nixos-hardware}/starfive/visionfive/v2/sd-image-installer.nix"
          ./visionfive2.nix
        ];
      };
    };
  };
}
