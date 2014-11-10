Skype in Docker
===============

If you ever wonder how to have multiple instances of Skype running.
This docker image might be a solution.
The need to run multiple instances come from the fact that you might have an account for work and a personal one.

Basic usage
-----------

    ./run ~/.local/.skype/work &

Tips
----

You might want to create wrapper scripts in `~/bin` something like `skype.work` and `skype.personal`
