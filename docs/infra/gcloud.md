# gcloud

## GLOBAL FLAGS:
--account= --configuration= --flatten= --project=
--format= config, csv, json, yaml, ...
--help

## check

```
gcloud components list
gcloud projects list
gcloud config list
```

## gcloud config configurations activate CONFIGURATION_NAME

```
alias gchange='gcloud config configurations activate'
```

## compute

```
gcloud compute instances list --format json --filter="status='RUNNING'"  | jq -r ".[].name" | sort
```
