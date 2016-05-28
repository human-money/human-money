## Note this code in alpha

Human Money is under active development. Please check back soon to see when the
network is planned to go live.

# Human Money Core

Human Money is stable cryptocurrency built for everyone :heart:.

Human Money Core is the software that runs the Human Money network.

# Deployment

## Deploy on Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Deploy via docker


By default your node will run in read only mode. To promote your server to
master status you must mine at least one share of the network.

# Development
    git clone git@github.com:mason-money/mason-money.git
    mix deps.get
    mix phoenix.server

or



# Goals
  * Minimize (or eliminate) price volatility.
  * Minimize energy consumption required to keep the network secure
  * Make the best possible developer experience for interacting with the
    protocol
  * Keep the protocol and the implementation as simple as possible

# Currency Peg
The unit of currency transacted on the  Human network is the Human dollar. The value of a Human dollar is [pegged](https://en.wikipedia.org/wiki/Fixed_exchange-rate_system) to the USD. Human nodes track exchange rates and create new currency only when deemed necessary to maintain the peg.

Read the [white paper](https://github.com/masonforest/masonmoney/blob/master/WHITEPAPER.md).
