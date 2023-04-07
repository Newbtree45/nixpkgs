with import <nixpkgs> {};

buildGoModule rec {
  pname = "miriconf";
  version = "0.5";

   src = fetchFromGitHub {
    owner = "MiriConf";
    repo = "miriconf-agent";
    rev = "b6536863bb32b4e3640a5ccbc23309f19ace5c4f";
    sha256 = "SHA256-079136F606C3F5F2E840E22A20D52EDE9C6323F1B43C740315B18DCB4521101F";
  };
  
  vendorHash = null;


  meta = with lib; {
    description = "An agent for miriconf used to manage multiple devices over a network.";
    homepage = "https://github.com/orgs/MiriConf/repositories";
  };
}
