# Dockerfile.base
This is an intermediate image of `Dockerfile`. It has all the packages installed in `Dockfile`, but without any configuration.

# Dockerfile.dev
This for building the final image based on `Dockerfile.base`, i.e. `Dockerfile` = `Dockerfile.base` + `Dockerfile.dev`. It dose all the configuration things left by the `base` image.