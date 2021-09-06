FROM nixos/nix:2.3.12

WORKDIR /home

COPY . /home

RUN echo 'substituters = https://hydra.iohk.io https://cache.nixos.org' >> /etc/nix/nix.conf
RUN echo 'trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=' >> /etc/nix/nix.conf

