# CDM prototype StarRocks dockerfiles

These are extremely naive Dockerfiles allowing deployment of StarRocks front end and
compute nodes in Rancher.

## IMPORTANT NOTE

StarRocks has many recommendations and requirements for the machines running the FE and CN nodes.
See:

https://docs.starrocks.io/docs/deployment/deployment_overview/

especially:

https://docs.starrocks.io/docs/deployment/environment_configurations/

These are NOT taken into account in these Dockerfiles.

## Variables

Variables that need to be set are documented in the scripts in the ./scripts directory.
In particular, see the *entrypoint.sh fiels for variables that are set to default values.

## Notes

* The dockerfiles use mostly default values, which is almost certainly bad.
