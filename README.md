[![Docker Repository on Quay](https://quay.io/repository/areafiftylan/lancie-admin/status "Docker Repository on Quay")](https://quay.io/repository/areafiftylan/lancie-admin) [![Build Status](https://travis-ci.org/AreaFiftyLAN/lancie-admin.svg?branch=master)](https://travis-ci.org/AreaFiftyLAN/lancie-admin)
# \<lancie-admin\>

Admin panel for the LANcie API

## Install the Polymer-CLI

First, make sure you have the [Polymer CLI](https://www.npmjs.com/package/polymer-cli) installed. Then run `polymer serve` to serve your application locally.

## Viewing Your Application

When viewing the application for the first time run:

```
$ bower install
```

After that you can use the following command to run the application locally:

```
$ polymer serve
```


## Building Your Application

```
$ polymer build
```

This will create a `build/` folder with `bundled/` and `unbundled/` sub-folders
containing a bundled (Vulcanized) and unbundled builds, both run through HTML,
CSS, and JS optimizers.

You can serve the built versions by giving `polymer serve` a folder to serve
from:

```
$ polymer serve build/bundled
```

## Building with Docker

To build the application with docker, issue the following command:
```
docker build -t lancie-admin .
```

To run the container:
```
docker run -p 8080:80 lancie-admin:latest
```

You can now view the admin page on `localhost:8080`,

## Running Tests

```
$ polymer test
```

Your application is already set up to be tested via [web-component-tester](https://github.com/Polymer/web-component-tester). Run `polymer test` to run your application's test suite locally.
