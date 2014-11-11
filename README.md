Skype in Docker
===============

If you ever wonder how to have multiple instances of Skype running.
This docker image might be a solution.
The need to run multiple instances come from the fact that you might have an account for work and a personal one.

Installation
------------

    docker pull diet/docker-skype
    docker run -t -i diet/docker-skype cat /app/host/skype.run > ~/bin/skype.run
	chmod +x ~/bin/skype.run

Basic usage
-----------

    skype.run ~/.local/.skype/work &

Tips
----

You might want to create wrapper scripts in `~/bin` something like `skype.work` and `skype.personal`. Which would call `skype.run` with appropriate directory.

Acknowledgements
----------------

This work is based and inspired by

  - Dockerfile of Daniel Mizyrycki <daniel@docker.com>
  - Running Google chrome in a container post from https://www.stgraber.org/category/planet-canonical/
