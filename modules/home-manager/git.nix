{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Bailey Vogt";
    userEmail = "s3906263@student.rmit.edu.au";
    extraConfig = { 
      init.defaultBranch = "main"; 
      credential.helper = "store";
    };
  };
}
