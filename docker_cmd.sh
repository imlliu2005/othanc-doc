docker run --name minio -p 9000:9000 \
-p 9090:9090 \
-d -v D:/minio/data:/data \
-v D:/minio/data:/root/.minio \
minio/minio server /data \
--console-address ":9090" --address ":9000"

# 启动minio 模拟aws s3
docker run --name miniotest01 \
-p 9000:9000 \
-p 9090:9090 \
-d -v D:/minio/data:/data \
-v D:/minio/data:/root/.minio \
-e "MINIO_REGION=eu-west-1" \
-e "MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE" \
-e "MINIO_SECRET_KEY=wJalrXUtnFEMI/K7MNG/bPxRfiCYEXAMPLEKEY" \
minio/minio server /data \
--console-address ":9090" --address ":9000"

docker run --name miniotest01 -p 9000:9000 -p 9090:9090 -d -v D:/minio/data:/data -v D:/minio/data:/root/.minio -e "MINIO_REGION=eu-west-1" -e "MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE" -e "MINIO_SECRET_KEY=wJalrXUtnFEMI/K7MNG/bPxRfiCYEXAMPLEKEY" minio/minio server /data --console-address ":9090" --address ":9000"

# 启动orthanc
docker run --name orthanctest01 \
-p 4242:4242 \
-p 8042:8042 \
-d -e ORTHANC__AWS_S3_STORAGE__BUCKET_NAME=my-sample-bucket \
-e ORTHANC__AWS_S3_STORAGE__REGION=eu-west-1 \
-e ORTHANC__AWS_S3_STORAGE__ACCESS_KEY=AKIAIOSFODNN7EXAMPLE \
-e ORTHANC__AWS_S3_STORAGE__SECRET_KEY=wJalrXUtnFEMI/K7MNG/bPxRfiCYEXAMPLEKEY \
-e ORTHANC__AWS_S3_STORAGE__ENDPOINT=http://192.168.4.244:9000/ \
-e ORTHANC__AWS_S3_STORAGE__VIRTUAL_ADDRESSING=false \
-e ORTHANC__AWS_S3_STORAGE__HYBRID_MODE=WriteToObjectStorage \
-e ORTHANC__AUTHENTICATION_ENABLED=false \
-e ORTHANC__DICOM_SERVER_ENABLED=false \
-e ORTHANC_WEB_VIEWER_PLUGIN_ENABLED=true \
orthancteam/orthanc


docker run --name orthanctest01 -p 4242:4242 -p 8042:8042 -d -e ORTHANC__AWS_S3_STORAGE__BUCKET_NAME=my-sample-bucket -e ORTHANC__AWS_S3_STORAGE__REGION=eu-west-1 -e ORTHANC__AWS_S3_STORAGE__ACCESS_KEY=AKIAIOSFODNN7EXAMPLE -e ORTHANC__AWS_S3_STORAGE__SECRET_KEY=wJalrXUtnFEMI/K7MNG/bPxRfiCYEXAMPLEKEY -e ORTHANC__AWS_S3_STORAGE__ENDPOINT=http://192.168.4.244:9000/ -e ORTHANC__AWS_S3_STORAGE__VIRTUAL_ADDRESSING=false -e ORTHANC__AWS_S3_STORAGE__HYBRID_MODE=WriteToObjectStorage -e ORTHANC__AUTHENTICATION_ENABLED=false -e ORTHANC__DICOM_SERVER_ENABLED=false -e ORTHANC_WEB_VIEWER_PLUGIN_ENABLED=true orthancteam/orthanc