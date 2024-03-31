#  build orthanc
sudo apt-get install -y libcairo-dev libpixman-1-dev libsdl2-dev
sudo apt install libsqlite3-dev
sudo apt-get update 
sudo apt-get install -y build-essential curl wget git python cmake pkg-config
sudo apt-get install -y mercurial unzip npm ninja-build p7zip-full gettext-base 

cd ~/dev/build/orthanc
cmake -DCMAKE_BUILD_TYPE=Release  -DSTATIC_BUILD=ON ../../orthanc/OrthancServer
make


### osimis-webviewer
### frontend
sudo apt install ruby ruby-dev 
sudo gem update
sudo gem install compass
npm install bower -g (node > 8)
npm install --unsafe-perm --python=python2.7 (node 8.17.0)
git checkout node_modules/gulp-injectInlineWorker/index.js
bower install
npm run build

### backend
mkdir Build
cd Build
cmake ../ -DCMAKE_BUILD_TYPE=Debug -DORTHANC_FRAMEWORK_VERSION=mainline -DALLOW_DOWNLOADS=ON -DSTANDALONE_BUILD=ON -DSTATIC_BUILD=ON
cmake ../ -DCMAKE_BUILD_TYPE=Release -DORTHANC_FRAMEWORK_VERSION=mainline -DALLOW_DOWNLOADS=ON -DSTANDALONE_BUILD=ON -DSTATIC_BUILD=ON
make -j2


#  build orthanc
sudo apt-get install -y libcairo-dev libpixman-1-dev libsdl2-dev
sudo apt install libsqlite3-dev
sudo apt-get update 
sudo apt-get install -y build-essential curl wget git python cmake pkg-config
sudo apt-get install -y mercurial unzip npm ninja-build p7zip-full gettext-base 

cd ~/dev/build/orthanc
cmake -DCMAKE_BUILD_TYPE=Release  -DSTATIC_BUILD=ON ../../orthanc/OrthancServer
make

# build orthanc-dicomweb
cd ~/dev/build/orthanc-dicomweb
cmake -DCMAKE_BUILD_TYPE=Release -DSTATIC_BUILD=ON -DALLOW_DOWNLOADS=ON ../../orthanc-dicomweb
make -j6

### build StoneWebViewer wasm 

pip install clang==14.0 && pip install libclang==14.0.1

<!-- cmake ../../orthanc-stone/Applications/StoneWebViewer/WebAssembly \
-DCMAKE_BUILD_TYPE=Release \
-DORTHANC_STONE_INSTALL_PREFIX=/home/liuning/work/devroot/build/install-wasm-stone-viewer \
-DCMAKE_TOOLCHAIN_FILE=/home/liuning/apps/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake \
-DSTATIC_BUILD=ON \
-DALLOW_DOWNLOADS=ON \
-DLIBCLANG=/usr/lib/x86_64-linux-gnu/libclang-14.so.1 \
-G Ninja -->

cmake ../../orthanc-stone/Applications/StoneWebViewer/WebAssembly -DCMAKE_BUILD_TYPE=Release -DORTHANC_STONE_INSTALL_PREFIX=/home/liuning/work/dev/builds/wasm-orthanc-stone -DCMAKE_TOOLCHAIN_FILE=/home/liuning/apps/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake -DSTATIC_BUILD=ON -DALLOW_DOWNLOADS=ON -DLIBCLANG=/usr/lib/llvm-14/lib/libclang-14.so.1 -G Ninja


### build stone webviewer plugin
#### 需要将上一步build出来的wasm 相关的文件放入指定目录（参见cmake） 目录: orthanc-stone/wasm-binaries/StoneWebViewer
<!-- set(ORTHANC_STONE_BINARIES "${CMAKE_SOURCE_DIR}/../../../wasm-binaries/StoneWebViewer/" -->
<!-- /home/liuning/work/devroot/orthanc-stone/wasm-binaries/StoneWebViewer -->

cmake ../../orthanc-stone/Applications/StoneWebViewer/Plugin -DCMAKE_BUILD_TYPE=Release -DSTATIC_BUILD=ON -DALLOW_DOWNLOADS=ON
make -j 6

### build rt-webviewer plugin
#### 需要将上一步build出来的wasm 相关的文件放入指定目录（参见cmake） 目录: orthanc-stone/wasm-binaries/StoneWebViewer
<!-- set(ORTHANC_STONE_BINARIES "${CMAKE_SOURCE_DIR}/../../../wasm-binaries/RtViewer/" -->
<!-- /home/liuning/work/devroot/orthanc-stone/wasm-binaries/RtViewer -->

cmake ../../orthanc-stone/Applications/Samples/RtViewerPlugin -DCMAKE_BUILD_TYPE=Release -DSTATIC_BUILD=ON -DALLOW_DOWNLOADS=ON
make -j 6

### build orthanc-webviewer plugin
$ mkdir Build
$ cd Build
$ cmake ../../orthanc-webviewer -DSTATIC_BUILD=ON -DCMAKE_BUILD_TYPE=Release
$ make

### build orthanc-object-storage aws

mkdir Build
cd Build
cmake ../../orthanc-object-storage/Aws -DCMAKE_BUILD_TYPE=Release -DSTATIC_BUILD=ON -DUSE_VCPKG_PACKAGES=OFF -G Ninja
ninja

### build ohif

cmake ../../orthanc-ohif -DSTATIC_BUILD=ON -DCMAKE_BUILD_TYPE=Release
make