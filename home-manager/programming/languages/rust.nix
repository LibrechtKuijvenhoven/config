{ pkgs, ... }:

{

  home.packages = with pkgs; [
    # Rust Language Server for editor integration
    rust-analyzer
    # Rust linter
    clippy
    # Rust formatter
    rustfmt
    # A modern alternative to `ls` for Rust
    lsd
    rustc
    # Other common Rust tools if you use them often
    # cargo-watch
    # cargo-expand
  ];
}
