ulimit -n 10000
sudo sysctl -w net.local.dgram.maxdgram=4096
export VIRTUOSO_HOME=/usr/local/virtuoso-git/var/lib/virtuoso/db
alias virtuoso-start='cd /usr/local/virtuoso-git/var/lib/virtuoso/db; /usr/local/virtuoso-git/bin/virtuoso-t -f'
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
alias solr-start="cd $PRJ_ROOT/solr-app-semantica; ./start-solr.sh"

