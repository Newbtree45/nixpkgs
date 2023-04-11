with import <nixpkgs> {};

let
  miriconf = (buildGoModule {
  name = "miriconf";

   src = fetchFromGitHub {
    owner = "MiriConf";
    repo = "miriconf-agent";
    rev = "b6536863bb32b4e3640a5ccbc23309f19ace5c4f";
    sha256 = "rf4t9NhQBgPjn06yAlziTogAOoCP0RVY8NOo3u/dREQ=";
  };
  
   vendorHash = "sha256-PfJNr7t/27PSnwIwFv0kHV3f+er0fpHwqddS8yS7ofo=";

});

in
stdenv.mkDerivation {
  name = "miriconf";
  src = ./.;
  buildInputs = [ miriconf ];
buildPhase = ''
    mkdir -p ${miriconf}/bin/miriconf
    ln -sfn ../../../../.. bin/miriconf
    export GOPATH="${miriconf}/bin/miriconf"
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp ${miriconf}/bin/miriconf $out/bin/miriconf
  '';
}
