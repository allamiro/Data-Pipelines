## RSYSLOG

rsyslog is a widely-used logging system on Unix-like operating systems. It's responsible for collecting and processing system logs, forwarding them to various destinations.

### Role 1: Data Collection

    +--------------+      +-------------------+      +-------------------+
    | Data Sources | ---> |  Data Collection  | ---> |   Data Ingestion  |
    +--------------+      +-------------------+      +-------------------+
           |                     |                          |
    [System logs, etc.]      [rsyslog]              [Other ingestion tools,
                                                       storage, etc.]
### Role 2: Data Ingestion

    +--------------+      +-------------------+      +-------------------+
    | Data Sources | ---> |  Data Collection  | ---> |   Data Ingestion  |
    +--------------+      +-------------------+      +-------------------+
           |                     |                          |
    [System logs, etc.]   [Other collection tools]     [rsyslog]
