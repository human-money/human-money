# Abstract

[Bitcoin](https://bitcoin.org/en/) and other cryptocurrencies have
proven that cryptocurrency capable of holding value. Human Money aims to take
what can be learned from Bitcoin and approve upon it. The value of a Bitcoin is
more volatile than a tradition currency. This volatility makes it [difficult to
use as a currency](http://online.wsj.com/public/resources/documents/NBER.pdf). Human Money solves this issue by pegging the value of a Human
Dollar to the value of US Dollar. This has proven to be successful in other
cryptocurrencies such as [NuBits](https://nubits.com/). 

Human Money uses a hybrid consensus/proof of work system to provide consensus
and prevent the [double spend issue](https://en.bitcoin.it/wiki/Proof_of_Stake).

Human Money uses the same methods as the Stellar Consensus Protocol
([WHITEPAPER](https://www.stellar.org/papers/stellar-consensus-protocol.pdf)) to
maintain consensus. However, there is only one
quorum.  To join this group a new node must solve a proof or work problem and have it
verified by the network.

## Mining

To maintain the peg miners mine shares of the network instead of mining new
currency directly. Shares are mined by hashing blocks similar to bitcoins are
mined in the Bitcoin network. However, Human Money blocks don't contain anything
related to transactions.

To mine a block miners encode the block using a  [Protocol
Buffer](https://developers.google.com/protocol-buffers/?hl=en) and calculate a
[SHA256 Hash](https://en.wikipedia.org/wiki/SHA-2) of the result.

### Block Contents

Property |  Description | Example Value
---------|---------------|--------------
Last Hash | The previous hash in the work chain | 320c63b05ab3ddc45ca6b54dc414b56a2ed64fac
Public Key | The miner's public key | b110bf3d84bacb1cfefb805e0551c4d0c470276836147ad8f5311ea34b790c3b
Nonce | An integer which is incremented until the target is hit | 57

If the hash value is larger than the targeted value the miner increments the
nonce value and tries again. If that hash value is smaller than the targeted
value the miner has mined a share.


To redeem that share the miner must setup a Human Money node. The miner then
sends the hash they calculated to their node and the node submits it to the
network. Once the network has reached consensus that the solution is valid the
miner rewarded one share.

Nodes start in read-only mode and are only included in determining consensus
after they've mined at least on share.

## Difficulty

Like the Bitcoin network, the [difficulty](https://en.bitcoin.it/wiki/Difficulty) of mining shares increases over time by reducing the target value.

Eventually as difficulty increases it will be unsustainable to mine shares
as the power consumed to mine them will cost more than the potential payouts.

Since the proof of work and consensus are separated consensus is still
able to continue without any more shares being mined.

## Signing a Transaction

To create a new transaction the sender encodes the following to binary using a
protocol buffer

They then sign the transaction using the [Ed25519](https://ed25519.cr.yp.to/)
signature system and send it to a node.


### Transaction Contents
Property |  Description | Required?| Example Value
---------|--------------|----------|--------------
Source | The public key of the sender | __required__ | df13773... (64 character)
Destination | The public key of the recipient | __required__ | 55a92009.. (64 characters)
Amount | The amount to be transacted in base units (0.0001 USD each) | __required__ | 15000 |
Nonce | Used for consesus | __required__ | 7 |


## Reaching Consensus

Each action on the Human Money network has a unique sequential id.  When a node
receives a new transaction it will assign it a potential sequence number 1
greater than previous action's.  The node will then sign the transaction and
send it to all other nodes for signing. While transactions are in the
propagating phase they may have the same potential sequence number. Nodes keep
track of which other nodes have signed which transactions. At any point in
time the network is a fixed size. Therefore a node can be aware when a transaction has been
signed by all other nodes.  Once this occurs that transaction goes into a
nomination phase. A node should only be voting to nominate one transaction at a
time. If a node is not currently voting to nominate a transaction it will hash
all eligible transactions (those who have propagated to all nodes in the
network) and the one with the smallest resulting hash will be submitted for
nomination. If a node is voting to nominate a transaction and it receives a
request to nominate a transaction with a lower hash it can change it's vote and
send the request to all other nodes. Requests for transactions with higher hash
values will be ignored. The network should converge on the transaction with the
lowest hash value. Once the entire network has voted to nominate a transaction
to that sequence number that transaction goes into a final round of signing. In
the final round of singing nodes can not change their vote. Once all nodes have
given their final signature that transaction is considered finalized.

## Banning nodes

If a node is unreachable or is preventing the network from reaching consensus
that node could be banned from the network. At any time any node can vote to ban
any other node. If all other nodes agree to ban that node the node is banned
and no longer included in consensus.

Groups of nodes can also be voted to be banned. If every node outside the group
agrees to ban the group the group is banned.

Note that 2 groups can form and agree to ban each other creating 2 separate networks. 

One node could also vote to ban all other nodes. It would reach consensus with
itself and form its own single node network.


## Dividends

To maintain the currency peg new currency must be created and distributed. When
demand for Human Money rises above the value of a US dollar distributing more
currency will increase supply and therefore drive down demand.

Any node can request a minting at anytime they deem necessary to maintain the
peg. Like any event on the Human Money network the action is not carried out
unless it's met with 100% consensus by of all the nodes.

The amount of currency created by the new minting is decided by the requesting
node and should reduce the value of 1 Human dollar to the value of 1 US Dollar
but no lower. When the currency is being bootstrapped this amount will need to
be determined manually.  After more widespread adoption occurs data can be
aggregated from currency exchanges to calculate this value.

It's in miners best interests not to minting too much currency because that will
over inflate the price.  If the value of the Human Dollar drops significantly
below the value of the US Dollar the value could quickly drop to zero making the
minted money worthless.

Once the minting is accepted by 100% of the nodes the new currency is
divided between the miners based on the number of shares they've mined.
