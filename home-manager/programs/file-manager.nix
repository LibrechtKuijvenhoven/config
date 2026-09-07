{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    
    # Optional settings and file overrides
    settings = {
      manager = {
        ratio = [ 1 4 3 ];
        sort_by = "modified";
        sort_sensitive = false;
        sort_reverse = true;
        sort_dir_first = true;
        show_hidden = false;
        show_symlink = true;
      };
    };
  };
}
