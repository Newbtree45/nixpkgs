with import <nixpkgs> {};

let
  miriconf = (buildGoModule {
  pname = "miriconf-agent";
  version = "main";

   src = fetchFromGitHub {
    owner = "MiriConf";
    repo = "miriconf-agent";
    rev = "b6536863bb32b4e3640a5ccbc23309f19ace5c4f";
    sha256 = "rf4t9NhQBgPjn06yAlziTogAOoCP0RVY8NOo3u/dREQ=";
  };
  
   vendorHash = "sha256-PfJNr7t/27PSnwIwFv0kHV3f+er0fpHwqddS8yS7ofo=";


  meta = with lib; {
    description = "An agent for miriconf used to manage multiple devices over a network.";
    homepage = "https://github.com/orgs/MiriConf/repositories";
  };
});

in
stdenv.mkDerivation {
  name = "miriconf";
   src = fetchFromGitHub {
    owner = "MiriConf";
    repo = "miriconf-agent";
    rev = "b6536863bb32b4e3640a5ccbc23309f19ace5c4f";
    sha256 = "rf4t9NhQBgPjn06yAlziTogAOoCP0RVY8NOo3u/dREQ=";
  };
  buildInputs = [ miriconf ];
  installPhase = ''
    mkdir -p $out/blob
    cp ${miriconf}/blob/main/main.go $out/blob/main/main.go
  '';
}
