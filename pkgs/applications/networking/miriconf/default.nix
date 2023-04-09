with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "miriconf-agent";
  version = "1.19";

   src = fetchFromGitHub {
    owner = "MiriConf";
    repo = "miriconf-agent";
    rev = "b6536863bb32b4e3640a5ccbc23309f19ace5c4f";
    sha256 = "rf4t9NhQBgPjn06yAlziTogAOoCP0RVY8NOo3u/dREQ=";
  };
  
 enableParallelBuilding = true;

  meta = with lib; {
    description = "An agent for miriconf used to manage multiple devices over a network.";
    homepage = "https://github.com/orgs/MiriConf/repositories";
  };
}