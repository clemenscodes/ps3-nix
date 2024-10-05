{
  pkgs,
  iso,
}:
pkgs.stdenv.mkDerivation {
  name = "uncharted-game";
  phases = "installPhase";
  installPhase = ''
    mkdir -p $out
    cd $out
    ${pkgs.p7zip}/bin/7z x ${iso}
  '';
}
