{ pkgs, inputs, config, ... }: {


  home.packages = with pkgs; [
    gcc
    clang-tools
    jdt-language-server
    lua-language-server
  ];

  imports = [
    inputs.nvimConfig.outputs.homeManagerModules.nvimConfig
  ];


}
