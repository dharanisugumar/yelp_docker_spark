## 

Start spark-master and worker as defined in docker-compose yml file
```
docker-compose up
```

Copy `com.newyorker.challenge-1.0-SNAPSHOT.jar` generated using yelp-dataset-challenge repo to `yelp_challenge/scala/` directory.

Copy the input data set `yelp_dataset.tar` to `yelp_challenge/scala/` directory.

```
cd yelp_challenge/scala/
docker build --rm=true -t yelp/challenge-app .
```

```
docker run -p 2222:22 --name yelp-challenge-app -e ENABLE_INIT_DAEMON=false --network docker-spark_default -v `pwd`:/opt --link spark-master:spark-master -t yelp/challenge-app /bin/bash /yelp_processor.sh yelp_dataset.tar
```
