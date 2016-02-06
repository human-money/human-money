# Abstract

[Bitcoin](https://bitcoin.org/en/) and other cryptocurrencies have
proven that cryptocurrency capable of holding value. Mason Money aims to take
what can be learned from Bitcoin and approve upon it. The value of a Bitcoin is
more volatile than a tradition currency. This volatility makes it [difficult to
use as a currency](http://online.wsj.com/public/resources/documents/NBER.pdf). Mason Money solves this issue by pegging the value of a Mason
Dollar to the value of US Dollar. This has proven to be successful in other
cryptocurrencies such as [NuBits](https://nubits.com/). 

Mason Money uses a hybrid consensus/proof of work system to provide consensus
and prevent the [double spend issue](https://en.bitcoin.it/wiki/Proof_of_Stake).

Mason Money uses the same methods as the Stellar Consensus Protocol
([WHITEPAPER](https://www.stellar.org/papers/stellar-consensus-protocol.pdf)) to
maintain consensus. However, there is only one
quorum.  To join this group a new node must solve a proof or work problem and have it
verified by the network.

## Mining

To maintain the peg miners mine shares of the network instead of mining new
currency directly. Shares are mined by hashing blocks similar to
[Bitcoin's](https://en.bitcoin.it/wiki/Block). However, Mason Money blocks don't
contain anything related to transactions.

Blocks are encoded into a binary format using a [Protocol
Buffer](https://developers.google.com/protocol-buffers/?hl=en) and doubled
hashed using [SHA256](https://en.wikipedia.org/wiki/SHA-2).

### Block Contents
Property |  Description | Example Value
---------|---------------|--------------
Last Hash | The previous hash in the work chain | 320c63b05ab3ddc45ca6b54dc414b56a2ed64fac
Public Key | The miner's public key | b110bf3d84bacb1cfefb805e0551c4d0c470276836147ad8f5311ea34b790c3b
Nonce | An integer which is incremented until the target is hit | 57

If the hash value is larger than the targeted value the miner increments the
nonce value and tries again. If that hash value is smaller than the targeted
value the miner has mined a share.


To redeem that share the miner must setup a Mason Money node. The miner then
sends the proof of work solution to their node, the node submits it to the
network and once the network has reached consensus that the solution is valid
the miner rewarded one share.

Nodes start in read-only mode and are only included in determining consensus
after they've mined at least on share.

## Difficulty

Like the Bitcoin network, the [difficulty](https://en.bitcoin.it/wiki/Difficulty) of mining shares increases over time by reducing the target value.

Eventually as difficulty increases it will be unsustainable to mine shares
as the power consumed to mine them will cost more than the potential payouts.

Since the proof of work and consensus are separated consensus is still
able to continue without any more shares being mined.
## Transaction Verification

To create a new transaction the sender serializes the following into a binary format using a protocol buffer.
They then sign the transaction and send it to a node.


### Transaction Contents
Property |  Description | Required?| Example Value
---------|--------------|----------|--------------
From Address | The address of the sender | _optional_ | mason$mason.money
From Public Key | The public key of the sender | __required__ | df13773...
To Address | The address of the recipient | _optional_ | bob$mason.money
To Public Key | The public key of the recipient | __required__ | 55a92009.. (64 characters)
Amount | The amount to be transacted in base units (0.0001 USD each) | __required__ | 15000 |


When a node receives a new transaction it will be assigned a sequence number. Sequence
numbers represent the order in which transactions occurred. The node will then
sign the transaction and send it to all other master nodes for signing. Once the
transaction has been signed by all of the master nodes the transaction is
considered verified and cannot be reversed.

## Dividends

To maintain the currency peg new currency must be created and distributed. When
demand for Mason Money rises above the value of a US dollar distributing more
currency will increase supply and therefore drive down demand.

Any node can request a minting at anytime they deem necessary to
maintain the peg. Like any event on the Mason Money network the action is not
carried out unless it's met with 100% consensus of all the master nodes.

The amount of currency created by the new minting is decided by the requesting
node and should reduce the value of 1 Mason dollar to the value of 1 US Dollar
but no lower. When the currency is being bootstrapped this amount will need to
be determined manually.  After more widespread adoption occurs data can be
aggregated from currency exchanges to calculate this value.

It's in miners best interests not to overinflate by minting too much currency.
If the value of the Mason Dollar drops significantly below the value of the US
Dollar the value could quickly drop to zero making the minted money worthless.

Once the minting is accepted by 100% of the master nodes the new currency is
divided between the miners based on the number of shares they've mined.

## Banning nodes

If a node is unreachable or is preventing the network from reaching consensus
that node could be banned from the network. At any time any node can vote to ban
any other node. If all other nodes agree to ban that node the node is banned
and no longer included in consensus.

Groups of nodes can also be voted to be banned. If a consensus among those nodes not
in the group is reached the group is banned.
