# 数据 132M 未压缩

### 新版minio
- 是否启用s3 Plugin viewer dicom数据下载速度对比
- 环境：orthanc + s3plugin
- 访问方式：远程（非部署机器）

```mermaid
    graph TB

    subgraph s3-plugin
        subgraph osimis-viewr
            a[cache-数据大小：59M
            下载时间：5.63s]

            a1[下载数据大小：59M
            下载时间：11.86s]
        end

        subgraph stone-viewer 
            b[下载数据大小：197M
            下载时间：18.95s]
        end

        subgraph ohif-viewer
            c[数据大小：148M dicom 132M js资源16M
            下载时间：13.05s]
        end
    end

    subgraph no-s3-plugin
        subgraph nosimis-viewr
            p[cache-下载数据大小：59M
            下载时间：5.81s]

            p1[
            下载数据大小：59M
            下载时间：10.56s]
        end 

        subgraph nstone-viewer 
            o[
            下载数据大小：197M
            下载时间：18.58s]
        end

        subgraph nohif-viewer
            i[数据大小：148M dicom 132M js资源16M
            下载时间：13.03s]
        end
    end

```
### Only Access Minio
- RestApi单独从minio拿数据时间调研
    数据量：132M
    时间：11.938s

- 用js调用s3 api 去下载dicom速度
    数据量：132M
    时间：12.04s

- mc下载（远端非本地加密后）
    数据量：132M
    下载时间：11s

```mermaid
    graph LR
    subgraph only-access-minio
        restapi[
        方式：rest api
        数据量：132M
        时间：11.938s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：12.04s]
        mc[
        方式：mc    
        数据量：132M
        时间：11s]
    end
```


### 旧版minio（映射到本地目录）
- local：
- minio（2022年3月份之前的版本）映射到本地磁盘的数据，通过RestApi http请求下载 
    数据量：132M
    下载时间：0.34s

- 使用minio 自带命令 mc去下载求下载速度
    数据量：132M
    下载时间：0.14s

- 用js调用s3 api 去下载dicom 求时间
    数据量：132M
    下载时间：0.38s

```mermaid
    graph LR
    subgraph only-access-old-minio-local
        restapi[
        方式：rest api
        数据量：132M
        时间：0.34s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：0.38s]
        mc[
        方式：mc    
        数据量：132M
        时间：0.14s]
    end
```

- remote：
- minio（2022年3月份之前的版本）映射到本地磁盘的数据，通过RestApi http请求下载 
    数据量：132M
    下载时间：11.951s

- 使用minio 自带命令 mc去下载求下载速度
    数据量：132M
    下载时间：11s

- 用js调用s3 api 去下载dicom 求时间
    数据量：132M
    下载时间：12.063s


```mermaid
    graph LR
    subgraph only-access-old-minio-remote
        restapi[
        方式：rest api
        数据量：132M
        时间：11.951s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：12.063s]
        mc[
        方式：mc    
        数据量：132M
        时间：11s]
    end
```

### 数据压缩后（gdcm压缩dicom --jpj2000）压缩后数据大小未改变
- 新版minio
- local
- minio（2022年3月份之前的版本）映射到本地磁盘的数据，通过RestApi http请求下载 
    数据量：132M
    下载时间：0.58s

- 使用minio 自带命令 mc去下载求下载速度
    数据量：132M
    下载时间：0.492s

- 用js调用s3 api 去下载dicom 求时间
    数据量：132M
    下载时间：0.646s

```mermaid
    graph LR
    subgraph only-access-minio-local
        restapi[
        方式：rest api
        数据量：132M
        时间：0.58s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：0.646s]
        mc[
        方式：mc    
        数据量：132M
        时间：0.492s]
    end
```

- remote
- minio（2022年3月份之前的版本）映射到本地磁盘的数据，通过RestApi http请求下载 
    数据量：132M
    下载时间：11.847s

- 使用minio 自带命令 mc去下载求下载速度
    数据量：132M
    下载时间：12s

- 用js调用s3 api 去下载dicom 求时间
    数据量：132M
    下载时间：11.965s

```mermaid
    graph LR
    subgraph only-access-minio-remote
        restapi[
        方式：rest api
        数据量：132M
        时间：11.847s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：11.965s]
        mc[
        方式：mc    
        数据量：132M
        时间：12s]
    end
```

- 旧版minio
- local
- minio（2022年3月份之前的版本）映射到本地磁盘的数据，通过RestApi http请求下载 
    数据量：132M
    下载时间：0.336s

- 使用minio 自带命令 mc去下载求下载速度
    数据量：132M
    下载时间：0.24s

- 用js调用s3 api 去下载dicom 求时间
    数据量：132M
    下载时间：0.395s

```mermaid
    graph LR
    subgraph only-access-old-minio-local
        restapi[
        方式：rest api
        数据量：132M
        时间：0.336s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：0.395s]
        mc[
        方式：mc    
        数据量：132M
        时间：0.24s]
    end
```

- remote
- minio（2022年3月份之前的版本）映射到本地磁盘的数据，通过RestApi http请求下载 
    数据量：132M
    下载时间：12.123s

- 使用minio 自带命令 mc去下载求下载速度
    数据量：132M
    下载时间：11s

- 用js调用s3 api 去下载dicom 求时间
    数据量：132M
    下载时间：12.069s

```mermaid
    graph LR
    subgraph only-access-old-minio-remote
        restapi[
        方式：rest api
        数据量：132M
        时间：12.123s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：12.069s]
        mc[
        方式：mc    
        数据量：132M
        时间：11s]
    end
```

### 打包dicom（132M）zip压缩包 再走一遍上面的流程比较下载速度
- 是否启用s3 Plugin viewer dicom数据下载速度对比
- 环境：orthanc + s3plugin
- 访问方式：远程（非部署机器）

```mermaid
    graph TB

    subgraph s3-plugin
        subgraph osimis-viewr
            a[cache-数据大小：59M
            下载时间：5.63s]

            a1[下载数据大小：59M
            下载时间：11.86s]
        end

        subgraph stone-viewer 
            b[下载数据大小：197M
            下载时间：18.95s]
        end

        subgraph ohif-viewer
            c[数据大小：148M dicom 132M js资源16M
            下载时间：13.05s]
        end
    end

    subgraph no-s3-plugin
        subgraph nosimis-viewr
            p[cache-下载数据大小：59M
            下载时间：5.58s]

            p1[
            下载数据大小：59M
            下载时间：11.01s]
        end 

        subgraph nstone-viewer 
            o[
            下载数据大小：197M
            下载时间：18.88s]
        end

        subgraph nohif-viewer
            i[数据大小：148M dicom 132M js资源16M
            下载时间：13.03s]
        end
    end

```

- RestApi单独从minio拿数据时间调研
    数据量：132M
    时间：11.85s

- 用js调用s3 api 去下载dicom速度
    数据量：132M
    时间：11.866s

- mc下载（远端非本地加密后）
    数据量：132M
    下载时间：11s(zip 压缩后到minio上是解压后存储的数据量为变化)

```mermaid
    graph LR
    subgraph only-access-old-minio-remote
        restapi[
        方式：rest api
        数据量：132M
        时间：11.85s]
        s3api[
        方式：s3 api
        数据量：132M
        时间：11.866s]
        mc[
        方式：mc    
        数据量：132M
        时间：11s]
    end
```