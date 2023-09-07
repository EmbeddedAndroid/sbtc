# Docker Based Development Environment

This is a collection of Dockerized services to provide a simple 
standalone development environment to sBTC developers. It also 
includes some helper scripts to make it easier to operate.

## Docker and Docker Compose

To use this environment, you must install:

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Building Containers

In order to deploy the environment, you must first build the images.

```
cd devenv 
./build.sh
```

If you prefer only to build a specific container:

```
cd devenv/bitcoin/
./build.sh
```

## Running Containers

To start the entire deployment simply run:

```
cd devenv
./up.sh
```

By default, this will start a BTC node on regtest, 
STX node on mocknet, stacks-api and database.

If you prefer to run a specific container:

```
cd devenv/bitcoin/
./up.sh
```

## Logging Containers

There is a helper script at the top level directory to facilitate logging:

```
./log bitcoin
./log stacks
./log stacks-api
./log stacks-explorer
./log postgres
```

## Mining

For a development environment we need to control block production, 
there is a helper script to do this:

```
cd devenv/
./mine.sh <number of blocks>
```
Once you mine blocks on bitcoin, there is a delay before the 
stacks mines those blocks, and relays the data to the API. If i
your explorer is crashing, just wait a few minutes and try again.

## Services

### Esplora
You can access the [Esplora](https://github.com/Blockstream/esplora)
explorer at:

```
http://127.0.0.1:8094
```
The Electrum RPC service is running on port 50001.

### Stacks
You can access the [Stacks Explorer](https://github.com/hirosystems/explorer)
at:

```
http://127.0.0.1:3000
```

The Stacks API service is running on port 3999.

## sBTC Development

First build the sBTC container

```
cd devenv/sbtc
./build
```

Now you can use the sbtc cli by calling

```
./devenv/sbtc/bin/sbtc <args>
```

## Stopping Containers

To stop the entire deployment simply run:

```
cd devenv
./down.sh
```

If you prefer to stop a specific container:

```
cd devenv/bitcoin
./down.sh
```

## Persistence 

At the moment, the container data will not persist. However it is 
easy to add persistent storage volumes if needed.

## TODO

- Why does it take stacks so long to start mining blocks?
- Faucet?
- Deploy Romeo to devnet, and document
- Investigate Docker Compose Fragment and Extensions.

