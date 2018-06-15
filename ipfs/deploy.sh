cd web;
gatsby build;

ipfs daemon &
ipfs add -r public

echo "Visit localhost:8080/ipfs/<HASH OF public FOLDER>"