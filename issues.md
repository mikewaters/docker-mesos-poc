## Runtime

# mesos-slave
1. Restarting mesos-slave service doesnt work

`mesos-slave respawning too fast, stopped` occurs when makingchange to a slave successfully connected to the cluster and then restarting.  fixed by a reboot of the slave
