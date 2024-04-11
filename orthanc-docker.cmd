### file copy container to manchine
1 从容器拷贝文件到宿主机
拷贝方式为：
docker cp 容器名：容器中要拷贝的文件名及其路径 要拷贝到宿主机里面对应的路径
例如，将容器：
mycontainer
中路径：
/opt/testnew/
下的文件：
file.txt
拷贝到宿主机：
/opt/test/
路径下，在宿主机中执行命令如下
docker cp mycontainer:/opt/testnew/file.txt /opt/test/
docker cp 3e232736ff8a:/tmp/orthanc.json /home/liuning/orthanc-conf/
container_id: 3e232736ff8a

2 从宿主机拷贝文件到容器
拷贝方式为：
docker cp 宿主机中要拷贝的文件名及其路径 容器名：要拷贝到容器里面对应的路径
例如，将宿主机中路径：
/opt/test/
下的文件：
file.txt
拷贝到容器：
mycontainer的：
/opt/testnew/
路径下，同样还是在宿主机中执行命令如下：
docker cp /opt/test/file.txt mycontainer:/opt/testnew/
docker cp /home/liuning/work/images/orthanc/plugins/* 3e232736ff8a:/usr/share/orthanc/plugins/


### orthanc config mount 

docker run --entrypoint=cat jodogne/orthanc:1.12.3 /etc/orthanc/orthanc.json > /tmp/orthanc.json


# 启动orthanc
docker run --name orthanctest01 \
-p 4242:4242 \
-p 8042:8042 \
-d -e ORTHANC__AWS_S3_STORAGE__BUCKET_NAME=my-sample-bucket \
-e ORTHANC__AWS_S3_STORAGE__REGION=eu-west-1 \
-e ORTHANC__AWS_S3_STORAGE__ACCESS_KEY=minio \
-e ORTHANC__AWS_S3_STORAGE__SECRET_KEY=miniopwd \
-e ORTHANC__AWS_S3_STORAGE__ENDPOINT=http://192.168.4.244:9000/ \
-e ORTHANC__AWS_S3_STORAGE__VIRTUAL_ADDRESSING=false \
-e ORTHANC__AWS_S3_STORAGE__HYBRID_MODE=WriteToObjectStorage \
-e ORTHANC__AUTHENTICATION_ENABLED=false \
-e ORTHANC__DICOM_SERVER_ENABLED=false \
-e ORTHANC_WEB_VIEWER_PLUGIN_ENABLED=true \
orthancteam/orthanc




docker run --name orthanctest01 -d -p 4242:4242 -p 8042:8042 orthancteam/orthanc


# 启动minio 模拟aws s3
docker run --name miniotest01 \
-p 9000:9000 \
-p 9090:9090 \
-d -v D:/minio/data:/data \
-v D:/minio/data:/root/.minio \
-e "MINIO_REGION=eu-west-1" \
-e "MINIO_ACCESS_KEY=minio" \
-e "MINIO_SECRET_KEY=miniopwd" \
minio/minio server /data \
--console-address ":9090" --address ":9000"


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