# rabbitmq-plugin-build-image

To execute the build, Run 
```
cd /path/to/rabbitmq-plugin-build-image
docker build -t "agco/rabbitmq-plugin-build-image" .
cd /path/to/rabbit/plugin
docker run -it -v `pwd`:/data agco/rabbitmq-plugin-build-image
```
This will copy your workdir to another dir, and push back the generated binaries when the target is completed.

The last parameter is the make task, like `dist clean` etc.

To just open the console call `bash` as last parameter
```
docker run -it -v `pwd`:/data agco/rabbitmq-plugin-build-image bash
```
