# Puppet Playground

>Latest Puppet playground (for your tests and developement) that just works!

This is work based on Openvox's [Crafty oss Example](https://github.com/voxpupuli/crafty/tree/main/openvox/oss)


## Clone the repository
Navigate to the chosen directory and clone the repository with:
```shell
git clone git@github.com:stexads/puppet-playground.git
```

The rest of this document assumes will list a series of commands that should
be typed from inside the cloned repository.
For example:
```shell
mkdir ~/sandbox
cd ~/sandbox
git clone git@github.com:stexads/puppet-playground.git
cd puppet-playground
```

## Start basic Playground setup
```shell
docker compose --profile play up
```

## Stop basic Playground setup

```shell
docker compose --profile play down -v
```

## Puppetboard
Open up: <http://127.0.0.1:8088/>

## Puppetserver
To login the puppetserver:
```shell
docker exec -it puppetserver bash
```

## Test an agent

### Generic agent (no systemd)
When the `play` profile is up and healthy, start a generic agent (no `systemd`):
```shell
docker run --rm --hostname puppet-agent --network crafty-oss -it ghcr.io/exogroup/generic/el9:latest /bin/bash
```

Using the `test` profile (note: this option has not been tested):
```shell
docker compose --profile test run testing agent -t
```

### Agent with systemd
First spin up a `systemd`-based image like `el9` with the following command:
```shell
docker run --privileged --rm --name agent --hostname stefano.0x3e.lan --network crafty-oss -it ghcr.io/exogroup/generic/el9:latest /sbin/init
```
Then, by using a seperate tty, login to the image:
```shell
docker exec -it agent bash
```
This will open up a shell in the agent.
Next we need to install `puppet` as the image does not come with `puppet` installed:
```shell
apt update && apt install -y puppet
```

### Connect agent to `puppetserver`.
Finally we can connect the agent to the puppetserver:
```shell
puppet agent -tv
```







## Start HDM (Hiera Data Manager)

```shell
docker compose --profile hdm up -d
```

then open up: <http://0.0.0.0:3000/>

## cleanup

```shell
docker compose --profile play down
docker compose --profile hdm down
docker compose --profile test down

docker volume rm oss_openvoxserver
docker volume rm oss_openvoxserver-ssl
docker volume rm oss_openvoxserver-ca
docker volume rm oss_openvoxdb
docker volume rm oss_openvoxdb-postgres
docker volume rm oss_agent-ssl

docker network rm crafty-oss
```


# Troubleshooting
## Certificate error
You might get the following error at some stage:
`Error: certificate verify failed [unable to get local issuer certificate for CN=puppet]`

Steps to resolve:
On `puppetserver`:

```shell
puppetserver ca list --all
puppetserver ca clean --certname <agent-node-certname>
```

On puppet agent:
```shell
sudo rm -rf /etc/puppetlabs/puppet/ssl
puppet agent -tv
```
