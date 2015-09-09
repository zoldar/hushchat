Hushchat
========

Playing around with ssh API. Nothing to see here for now. Move along.

### Quick start

First, fetch the code and do a basic setup:

    git clone git@github.com:zoldar/hushchat.git
    cd hushchat
    mkdir -p priv/{sys_dir,usr_dir/.ssh}
    ssh-keygen -t rsa -f priv/sys_dir/ssh_host_rsa_key
    ssh-keygen -t rsa -f priv/usr_dir/.ssh/id_rsa.pub
    cat ~/.ssh/id_rsa.pub > priv/usr_dir/.ssh/authorized_keys

Next, start the server:

    iex -S mix

Finally, connect to the server:

    ssh -p 2200 tehuser@localhost
