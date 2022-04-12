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

The [Cloud Run](https://cloud.google.com/run) applications will be exposed
on the internet providing a simple echo server.

Note: This code is solely for demonstration purposes.
This is not production-ready code, so use at your own risk.
If you are interested in battle-tested, production-ready Terramate code,
check out our blueprints:

* [Github](https://github.com/mineiros-io/terramate-blueprint-iac-github)


# How to use this project ?

## Pre-Requisites

* [Terraform](https://www.terraform.io/) == 1.1.7
* [Terramate](https://github.com/mineiros-io/terramate) >= 0.1.0
* Configure your GCP credentials using one of the supported [authentication mechanisms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#authentication)


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
* `stacks/<env>/service-accounts/cloud-run` : Stack that creates service account for cloud run services
* `stacks/<env>/cloud-runs/[app1,app2]` : Stacks that create Cloud Run services

As you navigate the project you will find multiple Terramate configuration files.
Each file will have documentation guiding you through its purpose and usage.

## Listing Stacks

To check if your Terramate installation is working and get an overview of the
available stacks just run:

```sh
terramate list
```

To get a list of all the stacks defined on the project. To check how each
stack is defined in detail you can use `terramate run` like this:

```sh
terramate run -- cat stack.tm.hcl
```


## Deploying Stacks

TODO: showcase how to run a single or more stacks, and all of them at once if needed.


## Making Changes: Change Detection + Code Generation = Fun!

TODO: showcase how to change Terramate globals + generate code.
Also provide instructions on how to define GCP projects/buckets/etc.
