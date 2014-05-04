mkdir -p /home/bae/runtime
rm -rf /home/bae/runtime/*

cd /home/bae/app
wget -O /home/bae/runtime/rr.tar.gz "http://bcs.duapp.com/hellorails/baerr-v1.tar.gz"
tar xzf /home/bae/runtime/rr.tar.gz -C /home/bae/runtime/
mkdir -p /home/bae/runtime/logs/
echo "build finished"
