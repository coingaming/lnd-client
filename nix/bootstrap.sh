#/bin/sh

set -e

export PATH=/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:$PATH

# Disable HTTP2 (related to https://github.com/NixOS/nix/issues/2733)
echo 'http2 = false' >> /etc/nix/nix.conf
nix-channel --add https://nixos.org/channels/nixos-19.09 nixpkgs
nix-channel --update
nix-env -iAP nixpkgs.openssh nixpkgs.git nixpkgs.cabal2nix nixpkgs.coreutils
nix-env -iAP cachix -f https://cachix.org/api/v1/install
cachix use all-hies

mkdir -p /tmp/.ssh/
mkdir -p $HOME/.ssh/
echo "$ROBOT_SSH_KEY" | base64 -d > /tmp/.ssh/id_rsa.robot
chmod 600 /tmp/.ssh/id_rsa.robot
eval `ssh-agent -s`
ssh-add /tmp/.ssh/id_rsa.robot
echo -e "Host *\n IdentityFile /tmp/.ssh/id_rsa.robot\n IdentitiesOnly yes\n UserKnownHostsFile /tmp/.ssh/known_hosts\n StrictHostKeyChecking no" > /tmp/.ssh/config
ssh-keyscan github.com >> /tmp/.ssh/known_hosts
cp /tmp/.ssh/* $HOME/.ssh/
echo -e "Host *\n IdentityFile $HOME/.ssh/id_rsa.robot\n IdentitiesOnly yes\n UserKnownHostsFile $HOME/.ssh/known_hosts\n StrictHostKeyChecking no" > $HOME/.ssh/config
chown -R nixbld1 /tmp/.ssh/
git submodule update --init --recursive --depth 1
