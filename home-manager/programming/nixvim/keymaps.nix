{ pkgs, ... }:
{
  globals.mapleader = " ";
  keymaps = [
     {
      mode = ["n"];
      key = "<leader>pv";
      action = "<cmd>Neotree position=current<CR>";
     }

  ];
}
