# docker-cleanup

Miscellaneous utilities to clean-up Docker cruft.

## Docker Volume Clean-Up

Examine danging Docker volumes for data that might matter before removing it.  Checkout my [blog post](https://blog.kylemanna.com/linux/2016/09/03/deleting-unused-docker-volumes/) on the topic where I freed up 1.8GB of space wasted by dangling volumes.

Example invocation:

    ===========================================
    :: Displaying fe93d89dd4747e47098f69741e967626bed0ae35c7a12c541f4ce7b4ca043ea3
    ===========================================

    /var/lib/docker/volumes/fe93d89dd4747e47098f69741e967626bed0ae35c7a12c541f4ce7b4ca043ea3
    └── _data
    ├── 9.4-main.pg_stat_tmp
    │   ├── db_0.stat
    │   ├── db_12141.stat
    │   └── global.stat
    └── 9.4-main.pid

    2 directories, 4 files

    creation: -
    modification: 2015-10-19 18:21:37.187453160 -0700
    size: 76K

    Delete fe93d89dd4747e47098f69741e967626bed0ae35c7a12c541f4ce7b4ca043ea3? [y/N]: y
    Executing: docker volume rm fe93d89dd4747e47098f69741e967626bed0ae35c7a12c541f4ce7b4ca043ea3
    fe93d89dd4747e47098f69741e967626bed0ae35c7a12c541f4ce7b4ca043ea3
