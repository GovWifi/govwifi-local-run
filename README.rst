GovWifi Local Run
=================

This attempts to run many of the part the make up GovWifi locally off you development machine.

This relies on the source code being checked-out and symlink into this directory.

Currently this runs the User Sign-up API, Authentication API and User DB locally.

.. contents::


Set Up
------

..image:: ./assets/rought-system-parts.png

Symlink in the govwifi-authentication-api, govwifi-user-signup-api into the
checkout directory. These are ignored in the .gitignore file.::

    ln -s ../govwifi-user-signup-api govwifi-user-signup-api
    ln -s ../govwifi-authentication-api govwifi-authentication-api

These directories need to appear as sub directories of the docker-compose.yml
for this process to work.

Running
-------

Getting all the parts built and running you do::

    # build the images and cache the steps
    make build

    # Force all images to be built cleanly from scratch
    make build NO_CACHE=--no-cache

    # run all the services
    make serve


Link / Address available on the host machine:

 - User DB localhost:3306
 - User Sign-up API http://localhost:18080/
 - Authentication API http://localhost:9080


Create a test user
------------------

How to create an initial user that we can then test with...

::

    # TBD
    #
    curl -X -d '{"source_number":"07100200300","destination_number":""}'