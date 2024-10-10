# BI Recruitment Task

## Description

This repo provide a set of preconfigured tools that can be used for the recruitment task for IFT:

* PostgreSQL database
* DBT
* Grafana

## Tasks

Based on the data available at the remote database, design and implement a dashboard to help a Project Manager :
  * Have an overview of the project progress
  * Identify improvment
  * Evaluate the project adoption

The data are base on the project [Waku](https://github.com/waku-org/).

The database configuration:
* host: `recruitment.free.technology`
* port: `5432`
* user: will be provided
* password: will be provided
* database name: `recuitment_task`
* schemas: `raw_github`,`raw_finance`

It is recommended to submit the tasks result as a git repository containing all the files to reproduce the result.
> If you are using this repo, we recommand that you export the grafana dashboard and add it with the dbt models to the git history.

This repo contain a preconfigured partial stack to let you focus on the data manipulation. You are free to use any free technology you like, on the condition we can easily reproduce the result.

A partical solution is fine too, as long as you document what is missing or needs improvment.

## Requirements

* Have docker installed

## Usage

* Deploy the container with `make run`
* Shutdown the containers with `make down`
* Build the dbt models with `make dbt-buidlt`
* Compile the dbt models with `make dbt-compile`

The data from the database and grafana are persisted with docker volumes.
