Docker image based on Alpine, with addition of nodejs/npm, python3, golang 1.8,
and Hugo static site generator. This image has everything you need to build
a static blog using Hugo and deploy the results with Firebase Hosting
(I use it to build my blog [mcohen.io](https://www.mcohen.io)).

The makefile supports three tasks:

* make build - build the Docker image
* make deploy - publish the Docker image
* make sh - run an interactive Bash in the published Docker image
