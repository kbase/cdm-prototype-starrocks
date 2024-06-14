#!/bin/bash

# sh ulimit behavior is very different

ulimit -u 65535
ulimit -n 65535

TF=/opt/starrocks/cn/conf/cn.conf

# Make ports configurable
sed -i "s#^be_port =.*#be_port = \${THRIFT_RPC_PORT}#" $TF
sed -i "s#^be_http_port =.*#be_http_port = \${HTTP_PORT}#" $TF
sed -i "s#^heartbeat_service_port =.*#heartbeat_service_port = \${HEARTBEAT_PORT}#" $TF
sed -i "s#^brpc_port =.*#brpc_port = \${BRPC_PORT}#" $TF
sed -i "s#^starlet_port =.*#starlet_port = \${STARLET_PORT}#" $TF

# Set up data config
echo 'block_cache_disk_path=${STARROCKS_DATA}/block_cache/' >> $TF
echo 'block_cache_meta_path=${STARROCKS_DATA}/block_cache/' >> $TF
echo 'datacache_disk_path=${STARROCKS_DATA}/datacache/' >> $TF
echo 'datacache_meta_path=${STARROCKS_DATA}/datacache/' >> $TF
echo 'user_function_dir=${STARROCKS_DATA}/lib/udf' >> $TF
echo 'local_library_dir=${STARROCKS_DATA}/lib/udf-runtime' >> $TF
echo 'pprof_profile_dir=${STARROCKS_DATA}/log' >> $TF
echo 'query_scratch_dirs=${STARROCKS_DATA}' >> $TF
echo 'small_file_dir=${STARROCKS_DATA}/lib/small_file/' >> $TF
echo 'spill_local_storage_dir=${STARROCKS_DATA}/spill' >> $TF
echo 'starlet_cache_dir=${STARROCKS_DATA}/storage/starlet_cache' >> $TF
echo 'storage_root_path=${STARROCKS_DATA}/storage' >> $TF
echo 'sys_log_dir=${STARROCKS_DATA}/log' >> $TF
echo 'sys_minidump_dir=${STARROCKS_DATA}' >> $TF

# I frankly have no idea what these are or whether they need to be persisted
echo 'pull_load_task_dir=${STARROCKS_DATA}/var/pull_load' >> $TF
echo 'query_debug_trace_dir=${STARROCKS_DATA}/query_debug_trace' >> $TF
