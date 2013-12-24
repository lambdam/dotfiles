Netcat file transfert
---------------------

Sending side

    tar cvzf - <file> | pv | netcat -l -p <port>

Receiving side

    netcat <sender-ip> <port> | pv | tar xvzf -
