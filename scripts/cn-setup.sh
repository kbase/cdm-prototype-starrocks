#!/bin/bash

# sh ulimit behavior is very different

ulimit -u 65535
ulimit -n 65535

TF=/opt/starrocks/cn/conf/cn.conf

sed -i "s#^be_port =.*#be_port = \${THRIFT_RPC_PORT}#" $TF
sed -i "s#^be_http_port =.*#be_http_port = \${HTTP_PORT}#" $TF
sed -i "s#^heartbeat_service_port =.*#heartbeat_service_port = \${HEARTBEAT_PORT}#" $TF
sed -i "s#^brpc_port =.*#brpc_port = \${BRPC_PORT}#" $TF
sed -i "s#^starlet_port =.*#starlet_port = \${STARLET_PORT}#" $TF
