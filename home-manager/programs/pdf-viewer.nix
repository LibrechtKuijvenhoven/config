{ pkgs, ... }: {
  programs.sioyek = {
    enable = true;
    config = {
      background_color = "0.1 0.1 0.1";
      page_separator_width = "2";
      custom_color_mode_background = "0.0 0.0 0.0";
    };
    bindings = {
      goto_table_of_contents = "t";
      toggle_statusbar = ";";
    };
  };
}
