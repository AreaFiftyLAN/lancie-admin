[![Docker Repository on Quay](https://quay.io/repository/areafiftylan/lancie-admin/status "Docker Repository on Quay")](https://quay.io/repository/areafiftylan/lancie-admin) [![Build Status](https://travis-ci.org/AreaFiftyLAN/lancie-admin.svg?branch=master)](https://travis-ci.org/AreaFiftyLAN/lancie-admin)
# \<lancie-admin\>

Admin panel for the LANcie API

## Install Dependencies

First, make sure you have the [Polymer CLI](https://www.npmjs.com/package/polymer-cli) installed. Then run `polymer serve` to serve your application locally.

Secondly, openssl uses a few files to increase randomness. These files must be present on the system. `touch /var/log/mail && touch /var/log/messages
` will allow you to run the next commands.

Last, add yarn and dependencies:
```
yarn
yarn global add bower
```

## Viewing Your Application

If you are trying to run the application for the first time, first run:

```
$ bower install
```

After that you can use the following command to run the application locally:

```
$ yarn serve
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
