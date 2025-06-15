{ pkgs, ... }:

{
    plugins.lsp = {
      enable = true;
      servers = {
        # Rust
        rust-analyzer = {
          enable = true;
          # Settings specific to rust-analyzer, if desired
          # settings = { ... };
        };
        # Go
        gopls.enable = true;

        # Node.js / TypeScript
        tsserver.enable = true; # For TypeScript
        eslint.enable = true; # For ESLint (requires nodePackages.eslint_d)

        # Nix
        nixd.enable = true; # Assuming you have `nil` installed in home.packages
        # nixd.enable = true; # If using nixd instead of nil
      };

      # Optional: configure LSP capabilities, keymaps, etc.
      # You might use `lsp_lines` or `lsp_signature` plugins for UI improvements.
    };

    # Example: If you use the nvim-cmp (completion) plugin, configure its LSP source
    # programs.nixvim.plugins.cmp = {
    #   enable = true;
    #   settings = {
    #     sources = [
    #       { name = "nvim_lsp"; }
    #       { name = "luasnip"; }
    #       { name = "buffer"; }
    #       { name = "path"; }
    #     ];
    #   };
    # };
}
