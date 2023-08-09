# Data Pipeline Builder

This is an attempt to automate the building of a data pipeline  utilizing the tools we discussed in the repository with python or ansible. We will attempt to a create a builder that takes in to the consideration that different data phases are running on a unix or linux based operating system.


## The process - client 1 and client 2 : 

    DataSources: client1.local.domain, client2.local.domain
    DataCollection: collector1.local.domain
    DataIngestion: ingestor1.local.domain
    DataStreaming: streamer1.local.domain, streamer2.local.domain, streamer3.local.domain
    DataProcessing: processor1.local.domain
    DataStorage: storage1.local.domain, storage2.local.domain
    DataVisualization: visualizer1.local.domain, visualizer2.local.domain

## The tools:

| Stage              | Component                 | Collection /Agent Tool  | Application             |
|--------------------|---------------------------|-------------------------|-------------------------|
| DataSources        | client1.local.domain      | rsyslog                 | Apache Logs             |
| DataSources        | client2.local.domain      | syslog                  | CISCO  Logs             |
| DataCollection     | collector1.local.domain   | fluentd                 | fluentd  listening  port|
| DataIngestion      | ingestor1.local.domain    | logstash                |                         |
| DataStreaming      | streamer1.local.domain    | rabbitq                 |   port           |
| DataStreaming      | streamer2.local.domain    | rabbitq                 |   port                      |
| DataStreaming      | streamer3.local.domain    | rabbitq                 |   port                      |
| DataProcessing     | processor1.local.domain   |                         |                         |
| DataStorage        | storage1.local.domain     |                         |                         |
| DataStorage        | storage2.local.domain     |                         |                         |
| DataVisualization  | visualizer1.local.domain  |                         |                         |
| DataVisualization  | visualizer2.local.domain  |                         |                         |


## Diagram for client 1 and client 2 :

