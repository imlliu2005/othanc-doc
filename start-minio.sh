docker run --name miniotest01 -p 9000:9000 -p 9090:9090 -d -v /home/liuning/minio/data:/data -v /home/liuning/minio/config:/root/.minio -e "MINIO_REGION=eu-west-1" -e "MINIO_ROOT_USER=minio" -e "MINIO_ROOT_PASSWORD=miniopwd" minio/minio server /data --console-address ":9090" --address ":9000"

# docker run -p 9000:9000 -p 9090:9090 \
# 		 -e "MINIO_SERVER_URL=http://192.168.1.123:9000" \
# 	     --net=host \
# 	     --name minio \
# 	     -d --restart=always \
# 	     -e "MINIO_ACCESS_KEY=admin" \
# 	     -e "MINIO_SECRET_KEY=admin123" \
# 	     -v /home/minio/data:/data \
# 	     -v /home/minio/config:/root/.minio \
# 	     minio/minio server \
# 	     /data --console-address ":9090" -address ":9000"

# docker run -p 9000:9000 -p 9090:9090 \
# 		 -e "MINIO_SERVER_URL=http://1192.168.4.192:9000" \
# 	     --net=host \
# 	     --name minio \
#          -e "MINIO_REGION=eu-west-1" \
# 	     -e "MINIO_ROOT_USER=minio" \
# 	     -e "MINIO_ROOT_PASSWORD=miniopwd" \
# 	     -v /home/liuning/minio/data:/data \
# 	     -v /home/liuning/minio/config:/root/.minio \
# 	     minio/minio server /data --console-address ":9090" -address ":9000"


docker run -d -p 9000:9000 -p 9090:9090 -e "MINIO_SERVER_URL=http://192.168.4.192:9000" --net=host --name minio -e "MINIO_REGION=eu-west-1" -e "MINIO_ROOT_USER=minio" -e "MINIO_ROOT_PASSWORD=miniopwd" -v /home/liuning/minio/data:/data -v /home/liuning/minio/config:/root/.minio minio/minio server /data --console-address ":9090" -address ":9000"



docker run -d -p 9000:9000 -p 9090:9090 -e "MINIO_SERVER_URL=http://192.168.4.192:9000" --net=host --name minio -e "MINIO_REGION=eu-west-1" -e "MINIO_ACCESS_KEY=minio" -e "MINIO_SECRET_KEY=miniopwd" -v /home/liuning/minio/data:/data -v /home/liuning/minio/config:/root/.minio minio/minio server /data --console-address ":9090" -address ":9000"

docker run -d -p 9000:9000 -p 9090:9090 --name minio -e "MINIO_REGION=eu-west-1" -e "MINIO_ACCESS_KEY=minio" -e "MINIO_SECRET_KEY=miniopwd" -v /home/liuning/minio/data:/data -v /home/liuning/minio/config:/root/.minio minio/minio server /data --console-address ":9090" -address ":9000"

docker run -d -p 9000:9000 -p 9090:9090 -e "MINIO_SERVER_URL=http://192.168.4.192:9000" --net=host --name minio2-192 -e "MINIO_REGION=eu-west-1" -e "MINIO_ACCESS_KEY=minio" -e "MINIO_SECRET_KEY=miniopwd" -v /home/liuning/minio/data192:/data -v /home/liuning/minio/config192:/root/.minio minio/minio server /data --console-address ":9090" -address ":9000"

