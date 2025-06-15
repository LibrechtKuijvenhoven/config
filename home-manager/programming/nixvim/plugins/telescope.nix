{ pkgs, ... }:

{
  # Enable the plugin
  plugins.telescope = {
    enable = true;
    # Configure telescope options
    settings = {
      defaults = {
        layout_strategy = "vertical";
        layout_config = {
          prompt_position = "top";
          height = 0.9;
          width = 0.9;
        };
        sorting_strategy = "ascending";
      };
      pickers = {
        find_files = {
          theme = "ivy";
          previewer = false;
        };
      };
    };
    # Define keybindings for the plugin
    #keymaps = [
    #  { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; }
    #  { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; }
    #  { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>"; }
    #  { mode = "n"; key = "<leader>fh"; action = "<cmd>Telescope help_tags<cr>"; }
    #];
  };
}
