let
   pkgs       = import <nixpkgs> {};
   stdenv     = pkgs.stdenv;
   ruby       = pkgs.ruby_2_1;
   bundler    = pkgs.bundler;
   bundlerEnv = pkgs.bundlerEnv;
   env = pkgs.bundlerEnv {
      name = "sampleapp2";
      gemfile = ./Gemfile;
      lockfile = ./Gemfile.lock;
      gemset = ./gemset.nix;
      inherit ruby;
   };
in 

stdenv.mkDerivation rec {
   name = "example-rails-app";
   version = "1.1.1.1";

   buildInputs = [
      pkgs.ruby_2_1
      pkgs.postgresql
      pkgs.bundler
      pkgs.inetutils # hostname
      pkgs.bundler
   ];

   src = ./.;
}
