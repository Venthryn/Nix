{ pkgs, inputs, config, ... }: {


  home.packages = with pkgs; [
    clang-tools
    jdt-language-server
    lua-language-server
  ];

  imports = [
    inputs.nvimConfig.outputs.homeManagerModules.nvimConfig
  ];


}
