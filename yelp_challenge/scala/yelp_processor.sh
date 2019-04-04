#!/bin/bash

# Extract the input data set

YELP_DATA_SET_TAR=/opt/yelp_dataset.tar
YELP_DATA_SET=/opt/yelp_dataset 
APP_JAR=/opt/com.newyorker.challenge-1.0-SNAPSHOT.jar
                             
mkdir -p $YELP_DATA_SET                     
tar xvf $YELP_DATA_SET_TAR -C $YELP_DATA_SET                                 
                                                                             
cd /usr/src/app                                                              
cp $APP_JAR target/
cp target/${SPARK_APPLICATION_JAR_NAME}.jar ${SPARK_APPLICATION_JAR_LOCATION}
mkdir -p src/main/resources/files/
ln -sf $YELP_DATA_SET/* src/main/resources/files/
                                                                             
sh /submit.sh
