# Data Pipeline Builder

This is an attempt to automate the building of a data pipeline  utilizing the tools we discussed in the repository with python or ansible. We will attempt to a create a builder that takes in to the consideration that different data phases are running on a unix or linux based operating system.




client1.local.domain --->+
client2.local.domain --->+   +--> collector1.local.domain ---> ingestor1.local.domain ---> streamer1.local.domain --->+
                         |                                           +--> streamer2.local.domain --->+
                         |                                           +--> streamer3.local.domain --->+--> processor1.local.domain
                         +------------------------------------------------------------------------------------------+
                                                                                                                    |
                                                                                                                    +--> [DataStorage]
                                                                                                                    |   | storage1.local.domain
                                                                                                                    |   | storage2.local.domain
                                                                                                                    +--> [DataVisualization]
                                                                                                                    |   | visualizer1.local.domain
                                                                                                                    |   | visualizer2.local.domain
                                                                                                                    +---------------------------

