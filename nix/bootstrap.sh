#/bin/sh

set -e

export NIX_SSHOPTS='source /etc/profile.d/nix.sh;'

echo "
substituters = https://cache.nixos.org https://hydra.iohk.io file:///tmp/nix_ci_cache
trusted-substituters = file:///tmp/nix_ci_cache
trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
system-features = kvm
http2 = false
require-sigs = false
sandbox = false
cores = 2
max-jobs = 4
" >> /etc/nix/nix.conf

mkdir -p /tmp/nix_ci_cache
mkdir -p /tmp/.ssh/
mkdir -p $HOME/.ssh/

echo '-----BEGIN OPENSSH PRIVATE KEY-----' >> /tmp/.ssh/id_ed25519
echo $BINARY_CACHE_KEY | sed -e 's/\s\+/\n/g' >> /tmp/.ssh/id_ed25519
echo '-----END OPENSSH PRIVATE KEY-----' >> /tmp/.ssh/id_ed25519
echo "$ROBOT_SSH_KEY" | base64 -d > /tmp/.ssh/id_rsa.robot


nix-channel --add https://nixos.org/channels/nixos-21.05 nixpkgs
nix-channel --update
nix-env -iAP \
  nixpkgs.gitMinimal \
  nixpkgs.docker \
  nixpkgs.openssh

echo "
substituters = file:///tmp/nix_ci_cache https://cache.nixos.org ssh://ubuntu@q-ci-cache.q.testenv.io https://hydra.iohk.io
trusted-substituters = ssh://ubuntu@q-ci-cache.q.testenv.io file:///tmp/nix_ci_cache
trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
system-features = kvm
http2 = false
require-sigs = false
sandbox = false
cores = 2
max-jobs = 4
" > /etc/nix/nix.conf

echo "
WantMassQuery: 1
Priority: 10
" >> /tmp/nix_ci_cache/nix-cache-info

chmod 600 /tmp/.ssh/id_rsa.robot
chmod 600 /tmp/.ssh/id_ed25519
eval `ssh-agent -s`
ssh-add /tmp/.ssh/id_ed25519
ssh-add /tmp/.ssh/id_rsa.robot
echo -e "Host *\n IdentityFile /tmp/.ssh/id_ed25519\n IdentitiesOnly yes\n UserKnownHostsFile /tmp/.ssh/known_hosts\n StrictHostKeyChecking no" >> /tmp/.ssh/config
echo -e "Host *\n IdentityFile /tmp/.ssh/id_rsa.robot\n IdentitiesOnly yes\n UserKnownHostsFile /tmp/.ssh/known_hosts\n StrictHostKeyChecking no" >> /tmp/.ssh/config
ssh-keyscan github.com >> /tmp/.ssh/known_hosts
ssh-keyscan q-ci-cache.q.testenv.io >> /tmp/.ssh/known_hosts
cp /tmp/.ssh/* $HOME/.ssh/
echo -e "Host *\n IdentityFile $HOME/.ssh/id_rsa.robot\n IdentitiesOnly yes\n UserKnownHostsFile $HOME/.ssh/known_hosts\n StrictHostKeyChecking no" >> $HOME/.ssh/config
echo -e "Host *\n IdentityFile $HOME/.ssh/id_ed25519\n IdentitiesOnly yes\n UserKnownHostsFile $HOME/.ssh/known_hosts\n StrictHostKeyChecking no" >> $HOME/.ssh/config
chown -R nixbld1 /tmp/.ssh/
echo "Check ssh connection to cache..."
ssh -oStrictHostKeyChecking=no ubuntu@q-ci-cache.q.testenv.io ls -la
