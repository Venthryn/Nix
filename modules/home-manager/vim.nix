{ pkgs, inputs, config, ... }: {

  imports = [
    inputs.nvimConfig.outputs.homeManagerModules.nvimConfig
  ];


}
