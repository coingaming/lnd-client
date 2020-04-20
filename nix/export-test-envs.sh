#!/bin/sh

#
# app
#

export LND_CLIENT_ENV="dev";
export LND_CLIENT_LOG_FORMAT="Bracket"; # Bracket | JSON
export LND_CLIENT_LIBPQ_CONN_STR="postgresql://nixbld1@localhost/lnd-client";
export LND_CLIENT_ENDPOINT_PORT="4000";
