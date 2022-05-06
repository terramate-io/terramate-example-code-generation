# terramate-example-code-generation

This project shows an example file/dir structure you can use with
[Terramate](https://github.com/mineiros-io/terramate) to keep your Terraform
code DRY.

Be sure to read through the [Terramate documentation](https://github.com/mineiros-io/terramate)
to understand the features of Terramate used here.

The example is organized as two environments, each environment will have:

* Its own [GCP Project](https://cloud.google.com/storage/docs/projects).
* Service account to be used when deploying Cloud Run services.
* Two [Cloud Run](https://cloud.google.com/run) applications.

The [Cloud Run](https://cloud.google.com/run) applications are simple
echo servers that will be reachable through public URLs provided by
[Cloud Run](https://cloud.google.com/run).

Note: This code is solely for demonstration purposes.
This is not production-ready code, so use at your own risk.


# How to use this project ?

## Pre-Requisites

* [Terraform](https://www.terraform.io/) == 1.1.7
* [Terramate](https://github.com/mineiros-io/terramate) >= 0.1.0
* Configure your GCP credentials using one of the supported [authentication mechanisms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication)
* Google Cloud Provider account
* At least one [GCP project](https://cloud.google.com/storage/docs/projects)
* GCP project has a proper billing account configured


# How is the code organized ?

This is the overall structure of the project:

```
├── modules
│   └── cloud-run
└── stacks
    ├── prod
    │   ├── cloud-runs
    │   │   ├── app1
    │   │   ├── app2
    │   └── service-accounts
    │       └── cloud-run
    └── staging
        ├── cloud-runs
        │   ├── app1
        │   ├── app2
        └── service-accounts
            └── cloud-run
```

* `modules/cloud-run` : Local module, useful to showcase change detection
* `stacks/prod` : All stacks belonging to the prod environment
* `stacks/staging` : All stacks belonging to the prod environment
* `stacks/<env>/service-accounts/cloud-run` : Stacks that creates service accounts for the cloud run services
* `stacks/<env>/cloud-runs/[app1,app2]` : Stacks that create Cloud Run services

As you navigate the project you will find multiple Terramate configuration files.
Each file will have documentation guiding you through its purpose and usage.


## Listing Stacks

To check if your Terramate installation is working and get an overview of the
available stacks just run:

```sh
terramate list
```

To check how each stack is defined in detail you can use `terramate run`:

```sh
terramate run -- cat stack.tm.hcl
```

This will run on each stack directory the command `cat stack.tm.hcl`.
The output will be the definition of all stacks.

Later we are going to use the same mechanism to create and destroy all stacks.


## Deploying Stacks

Before we try to deploy any stacks, beware that this will require you
to have [GCP credentials](https://cloud.google.com/docs/authentication/getting-started)
and deploying infrastructure will incur into costs (check the
[pre-requisites](#pre-requisites) section for more details).

On `stacks/config.tm.hcl` you will find the `terraform_google_provider_project` 
global which configures the project where infrastructure will be created.

It is important to change that to a [GCP project](https://cloud.google.com/storage/docs/projects)
where you have appropriate permissions.

Once the configuration is changed we need to update the generated code by running:

```sh
terramate generate
```

At this point since our project has uncommitted changes Terramate will prevent us
from running any commands. Create a branch (or use the flag `--disable-check-git-uncommitted`
to disable the git checks):

```
git checkout -b <your branch name>
```

And commit all the changed files.

Now we initialize all our stacks:

```
terramate run -- terraform init
```

Check how their plans look like:

```
terramate run -- terraform plan
```

And apply them:

```
terramate run -- terraform apply
```

For each Cloud Run service deployed there will be an output with the URL to
the deployed service, like this:

```
url = "https://terramate-app1-<env>-<hash>-lz.a.run.app"
```

You can check the outputs with:

```
terramate run -- terraform output
```

Open the URL on the browser to check the running service.

To avoid unnecessary charges to your account let's destroy all stacks:

```
terramate run --reverse -- terraform destroy
```

The `--reverse` flag runs all stacks in reversed order, which is desirable
when destroying resources.
