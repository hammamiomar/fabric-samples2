## What Im doing now

* addPeers5SoloTest
  * This is kavyas addPeers5 network, being adapted to a solo network. It is to have 1 orderer, and 2 organizations, with 2 peers each.
  * What I have so far: the certificate and genesis block can be made, and the network can come up.
  * Error: However, after this when I want to run scripts/script.sh for ./byfn.sh up , it is not being able to get the MSP and initiate the chaincode. Getting the error "Cannot run peer because cannot init crypto"
  * Other future errors or maybe a cause: the docker compose files. The default compose file is using compose-cli, but I created a compose file thats just docker-compose. Maybe this file I made is missing something. 
* SoloTest
  * This is just a default fabric sample solo network. I thought maybe I can get this to work, and then use the chaincode on this default network.
  * Error: Even when the cryptoconfig and configtx file are the same, I cannot seem to generate the genesis block. I get the error "Error on outputBlock: could not create bootstrapper: could not create channel group: error adding policies to channel group: no policies defined"
  * I have not looked into this too much yet, as the addPeers5SoloTest has been a main goal, as I am able to get further with it.



