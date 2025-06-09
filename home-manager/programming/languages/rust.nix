{ pkgs, ... }:

{
  programs.rust = {
    enable = true;
    # This enables the `rustc` and `cargo` commands in your PATH.
    # It pulls from `pkgs.rustc` by default.

    # If you need a specific Rust toolchain (e.g., nightly, or a precise stable version),
    # you can use `rust-bin` and define `defaultToolchain`:
    # defaultToolchain = pkgs.rust-bin.fromRustupToolchainFile {
    #   rust-toolchain-file = ../path/to/your/rust-toolchain.toml; # Adjust path
    # };
    # Or, if you want a specific stable version regardless of a toolchain file:
    # defaultToolchain = pkgs.rust-bin.stable."1.76.0".default; # Example specific version
  };

  home.packages = with pkgs; [
    # Rust Language Server for editor integration
    rust-analyzer
    # Rust linter
    clippy
    # Rust formatter
    rustfmt
    # A modern alternative to `ls` for Rust
    lsd
    # Other common Rust tools if you use them often
    # cargo-watch
    # cargo-expand
  ];
}
