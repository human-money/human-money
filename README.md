## Note this code in alpha

Mason Money is under active development. Please check back soon to see when the
network is planned to go live.

# Mason Money Core

Mason Money is stable cryptocurrency built for everyone :heart:.

Mason Money Core is the software that runs the Mason Money network.

# Deployment

    git clone git@github.com:mason-money/mason-money.git
    mix deps.get
    mix phoenix.server

or

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

By default your node will run in read only mode. To promote your server to
master status you must mine at least one share of the network.


# Goals
  * Minimize (or eliminate) price volatility.
  * Minimize energy consumption required to keep the network secure
  * Create a payment process that is user friendly. (Payment addresses look like
    email addresses ie
    "mason$mason.money"
  * Make the best possible developer experience for interacting with the
    protocol
  * Keep the protocol and the implementation as simple as possible

# Currency Peg
The unit of currency transacted on the  Mason network is the Mason dollar. The value of a Mason dollar is [pegged](https://en.wikipedia.org/wiki/Fixed_exchange-rate_system) to the USD. Mason nodes track exchange rates and create new currency only when deemed necessary to maintain the peg.

Read the [white paper](https://github.com/masonforest/masonmoney/blob/master/WHITEPAPER.md).
