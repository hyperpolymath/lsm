# SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
#
# flake.nix - Nix Flake for lsm (fallback package manager)
# Usage: nix build
#        nix develop

{
  description = "LSM - Liquid State Machine (Spiking Neural Network reservoir in Rust)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          extensions = [ "rust-src" "rustfmt" "clippy" ];
        };
      in
      {
        packages.default = pkgs.rustPlatform.buildRustPackage {
          pname = "lsm";
          version = "0.1.0";
          src = ./.;
          cargoLock = {
            lockFile = ./Cargo.lock;
          };

          meta = with pkgs.lib; {
            description = "Liquid State Machine - Spiking Neural Network reservoir in Rust";
            homepage = "https://github.com/hyperpolymath/lsm";
            license = with licenses; [ mit agpl3Plus ];
            maintainers = [ ];
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustToolchain
            cargo-audit
            cargo-outdated
            cargo-tarpaulin
          ];

          shellHook = ''
            echo "LSM development environment"
            echo "Rust: $(rustc --version)"
            echo ""
            echo "Available commands:"
            echo "  cargo build    - Build the project"
            echo "  cargo test     - Run tests"
            echo "  cargo audit    - Security audit dependencies"
            echo "  cargo clippy   - Run linter"
          '';
        };
      }
    );
}
