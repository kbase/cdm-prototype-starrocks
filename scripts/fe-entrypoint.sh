#!/bin/sh

# Note that the STARROCKS_HOME variable should also be set to
# determine where to save metadata, logs, etc.

mkdir -p $STARROCKS_HOME

# NOTE: All FE nodes in a cluster must have the same http port:
# https://docs.starrocks.io/docs/deployment/deploy_manually/

export HTTP_PORT=${HTTP_PORT:-8030}
export THRIFT_RPC_PORT=${THRIFT_RPC_PORT:-9020}
export SQL_QUERY_PORT=${SQL_QUERY_PORT:-9030}
export EDIT_LOG_PORT=${EDIT_LOG_PORT:-9010}

echo "STARROCKS_HOME=${STARROCKS_HOME}"
echo "HTTP_PORT=${HTTP_PORT}"
echo "THRIFT_RPC_PORT=${THRIFT_RPC_PORT}"
echo "SQL_QUERY_PORT=${SQL_QUERY_PORT}"
echo "EDIT_LOG_PORT=${EDIT_LOG_PORT}"
echo "START_FOLLOWER_W_LEADER_EDIT_LOG_URL=${START_FOLLOWER_W_LEADER_EDIT_LOG_URL}"

# NOTE: this env var is only required the first time the follower is added to the cluster
# See https://docs.starrocks.io/docs/deployment/deploy_manually/
if [ -n "$START_FOLLOWER_W_LEADER_EDIT_LOG_URL" ]; then
	/opt/starrocks/fe/bin/start_fe.sh --helper $START_FOLLOWER_W_LEADER_EDIT_LOG_URL;
else
	/opt/starrocks/fe/bin/start_fe.sh;
fi
