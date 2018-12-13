# Fabriq Update

The Sixclear Fabriq Platform Server deploys to an on-premise Kubernetes cluster. To make releases
easy to track and deploy, each version is bundled as a tarball and included in a github release.
To pull a new version, download this project to a machine on your cluster and follow the instructions below.

## Instructions

To pull a new version of the Sixclear Fabriq Platform Server, you need 3 pieces of information:

- A github access token for accessing your project repo
- The project name for your install of the Sixclear Fabriq Platform Server
- The version tag you wish to update to in the format `vN.N`

If your project name is "fabriq-customer", your github access token is `3ae575f67c71c24ec65qcde08f024e040dea2861` and
the version you want to update to is `v1.1` you will run the command:

```bash
bin/update.sh --token=3ae575f67c71c24ec65qcde08f024e040dea2861 --tag=v1.1 --project=fabriq-customer
```

The update script will download the version tag you pass and will decompress it into the `updates` directory with
a unique name of `fabriq-release-[TAG]-[DATETIME]-[CHECSKSUM]`.

To deploy the version, `cd` into the release directory and follow the deploy instructions in the README.txt.
