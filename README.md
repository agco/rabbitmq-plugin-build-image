# rabbitmq-plugin-build-image

To execute the build, Run `docker run -v ``pwd``:/data tiagodeoliveira/rabbitmq-plugin-build test` it will copy your workdir to another dir, and push back the generated binaries when the target is completed.

The last parameter is the make task, like `dist clean` etc...
