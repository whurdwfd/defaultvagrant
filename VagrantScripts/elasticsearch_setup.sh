#Install ElasticSearch 1.4.2
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java7-installer
sudo wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.deb
sudo dpkg -i --force-confold elasticsearch-1.4.2.deb
sudo update-rc.d elasticsearch defaults 95 10
sudo service elasticsearch restart

#Wait for elastcicsearch to be ready
while ! curl http://127.0.0.1:9200/
do
  echo "$(date) - waiting for ElasticSearch to be ready"
  sleep 3
done
echo "$(date) - ElasticSearch is Ready"
