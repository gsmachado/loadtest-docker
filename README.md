
# loadtest-docker

This image simply provides a docker container with the loadtest project (https://www.npmjs.com/package/loadtest).

Therefore, you can use the docker container to start load tests to a specific target.

The image based on this Dockerfile is published on:
https://hub.docker.com/r/gsmachado/loadtest-docker/

## How to use it

In order to execute the load tests, you can perform:

```
docker run gsmachado/loadtest-docker bash -c '<LOADTEST_COMMAND>'
```

where the `<LOADTEST_COMMAND>` can be, for example, the following:

```
loadtest -t 20 -c 10 --rps 10 -k https://www.google.com
```

The documentation from https://www.npmjs.com/package/loadtest brings all the options and possibilities on how to perform the load tests. In the example above, the load test will run for 20 seconds, with 10 clients (concurrency), and reaching 10 requests per second.

The whole docker command, as an example, would be:

```
docker run gsmachado/loadtest-docker bash -c 'loadtest -t 20 -c 10 --rps 10 -k https://www.google.com'
```

## Running from a Cloud Foundry application

The file `manifest-example.yml` provides an example on how to run the load tests within a Cloud Foundry app.

Therefore, you can run:

```
cf push -f manifest-example.yml --docker-image gsmachado/loadtest-docker
```

And, at the same time (executing in another terminal), you can check the results of the load test by checking the Cloud Foundry app logs:

```
cf logs LoadTestFromCloudFoundry
```

### Why? What's the advantage?

Well, the real advantage of having load tests packed in a Cloud Foundry app is that you can scale up/down the amount of instances, memory, disk space, etc, etc. Then, your load tests might get more "powerful".

Of course, you can orchestrate the load tests app to start, perform the tests, collect the results, and then delete the app. However, this is not covered in this git repo project. If you do it, let me know. :-)

## How to build and publish on your own

If you are in the same directory of the `Dockerfile`, just execute:

```
docker build -t <YOUR_USER>/loadtest-docker:v1 -t <YOUR_USER>/loadtest-docker:latest ./
```

where the `<YOUR_USER>` can be your DockerHub username. The command will create the tag `v1` and also the `latest`. If you release a `v2`, don't forget to also update the `latest` tag.

Then, to publish to DockerHub, execure:

```
docker push <YOUR_USER>/loadtest-docker
```


