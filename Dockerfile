#Version=0.6.1
FROM library/vault:0.6.1

COPY startup.sh /usr/local/bin/startup.sh
ENTRYPOINT ["startup.sh"]
