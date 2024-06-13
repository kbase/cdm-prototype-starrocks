#!/bin/sh

TF=/opt/starrocks/fe/conf/fe.conf

# NOTE: All FE nodes in a cluster must have the same http port:
# https://docs.starrocks.io/docs/deployment/deploy_manually/

sed -i "s#^http_port =.*#http_port = \${HTTP_PORT}#" $TF
sed -i "s#^rpc_port =.*#rpc_port = \${THRIFT_RPC_PORT}#" $TF
sed -i "s#^query_port =.*#query_port = \${SQL_QUERY_PORT}#" $TF
sed -i "s#^edit_log_port =.*#edit_log_port = \${EDIT_LOG_PORT}#" $TF

echo "# enable shared data, set storage type, set endpoint" >> $TF
echo "run_mode = shared_data" >> $TF
echo "cloud_native_storage_type = S3" >> $TF
echo 'aws_s3_endpoint = ${MINIO_URL}' >> $TF

echo "# set the path in MinIO" >> $TF
echo 'aws_s3_path = ${MINIO_BUCKET}' >> $TF

echo "# credentials for MinIO object read/write" >> $TF
echo 'aws_s3_access_key = ${MINIO_ACCESS_KEY}' >> $TF
echo 'aws_s3_secret_key = ${MINIO_SECRET_KEY}' >> $TF
echo "aws_s3_use_instance_profile = false" >> $TF
echo "aws_s3_use_aws_sdk_default_behavior = false" >> $TF

echo "# Set this to false if you do not want default" >> $TF
echo "# storage created in the object storage using" >> $TF
echo "# the details provided above" >> $TF
echo "enable_load_volume_from_conf = true" >> $TF