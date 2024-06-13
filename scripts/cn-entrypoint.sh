#!/usr/bin/env bash

# Note that the STARROCKS_HOME variable should also be set to
# determine where to save metadata, logs, etc.

mkdir -p $STARROCKS_HOME

export THRIFT_RPC_PORT=${THRIFT_RPC_PORT:-9060}
export HTTP_PORT=${HTTP_PORT:-8040}
export HEARTBEAT_PORT=${HEARTBEAT_PORT:-9050}
export BRPC_PORT=${BRPC_PORT:-8060}
export STARLET_PORT=${STARLET_PORT:-9070}

echo "STARROCKS_HOME=${STARROCKS_HOME}"
echo "THRIFT_RPC_PORT=${THRIFT_RPC_PORT}"
echo "HTTP_PORT=${HTTP_PORT}"
echo "HEARTBEAT_PORT=${HEARTBEAT_PORT}"
echo "BRPC_PORT=${BRPC_PORT}"
echo "STARLET_PORT=${STARLET_PORT}"

if [ -n "$SLEEP_FOR" ]; then
	sleep $SLEEP_FOR;
fi

/opt/starrocks/cn/bin/start_cn.sh
