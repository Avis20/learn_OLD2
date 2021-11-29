
# build
```
docker build -t identidock .
```

# run

```
docker run --rm -p 80:9090 --name web identidock
```
```
$ curl localhost
Hello, World!
```
