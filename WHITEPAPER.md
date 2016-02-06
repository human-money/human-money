## Abstract [Bitcoin](https://bitcoin.org/en/) and other cryptocurrencies have
proven that cryptocurrency capable of holding value. Mason money aims to take
what can be learned from Bitcoin and approve upon it. The value of a Bitcoin is
more volatile than a tradition currency. This volatility makes it difficult to
use as a currency. Mason Money solves this issue by pegging the value of a Mason
Dollar to the value of US Dollar. This has proven to be successful in other
cryptocurrencies such as [NuBits](https://nubits.com/). 

Mason Money uses a hybrid consensus/proof of work system to provide consensus
and prevent the [double spend issue](https://en.bitcoin.it/wiki/Proof_of_Stake).

Mason Money uses the same methods as the Stellar Consensus Protocol
([WHITEPAPER](https://www.stellar.org/papers/stellar-consensus-protocol.pdf)) to
maintain consensus. However, there is a fixed number of nodes in a single
quorum.  To join this group a new node must complete a proof or work and have it
verified by the network.

## Mining

To maintain the peg miners mine shares of the network instead of mining new
currency directly. Shares are mined by hashing blocks similar to
[Bitcoin's](https://en.bitcoin.it/wiki/Block) however, mason money blocks don't
contain anything related to transactions.

Blocks are encoded into a binary format using a [Protocol
Buffer](https://developers.google.com/protocol-buffers/?hl=en) and doubled
hashed using [SHA256](https://en.wikipedia.org/wiki/SHA-2).

Property |  Description | Example Value ---------|---------------|--------------
Last Hash | The previous hash in the work chain
|320c63b05ab3ddc45ca6b54dc414b56a2ed64fac Public Key | The Miner's public key |
b110bf3d84bacb1cfefb805e0551c4d0c470276836147ad8f5311ea34b790c3b Nonce | An
integer which is incremented until the target is hit | 57


If the hash value is larger than the targeted value the miner increments the
Nonce value and tries again. If that hash value is smaller than the targeted
value the miner has mined a Mason Share.


To redeem that share the miner must setup a Mason Money Node. The miner then
sends the proof of work solution to their node, the node submits it to the
network and once the network has reached consensus that the solution is valid
the miner rewarded one share.

Nodes start in read-only mode and are only included in determining consensus
after they've mined at least on share.

## Transaction Verification

Transactions are created using the following inputs

Property |  Description | Required?| Example Value
---------|--------------|----------|-------------- From Address | The address of
the sender | _optional_ | mason$mason.money From Public Key | The public key of
the sender | __required__ |
df137735f033534e62849164d28e3f8e8a91263f074de7d037392faccfdc5e20 To Address |
The address of the recipient | _optional_ | bob$mason.money To Public Key | The
public key of the recipient | __required__ |
55a920091fa6095eda010ddf8c364dff22a1adf7ce4cc68cf8731c2ae2773b66 Amount | The
amount to be transacted in Mason dollars | __required__ | 1.50 |

These inputs are then serialized into a binary format using a protocol buffer.
This data is signed using the sender's private key and submitted to a node.

When a transaction comes in it will be assigned a sequence number. Sequence
numbers represent the order in which transactions occurred. The node will then
sign the transaction and send it to all other master nodes for signing. Once the
transaction has been signed by all of the master nodes the transaction is
considered verified and cannot be reversed.

## Dividends

To maintain the currency peg new currency must be created an distributed. When
demand for Mason Money rises above the value of a US dollar distributing more
currency will increase supply and therefore drive down demand.

Any miner running a node can request a minting at anytime they deem necessary to
maintain the peg. Like any event on the Mason Money network the action is not
carried out unless it's met with 100% consensus of all the master nodes.

The amount of the minting is decided by the requester and should reduce the
value of 1 Mason dollar to the value of 1 US Dollar but no lower. When the
currency is being bootstrapped this amount will need to be determined manually.
After more widespread adoption occurs data can be aggregated from currency
exchanges to calculate this value.

It's in miners best interests not to overinflate by minting too much currency.
If the value of the Mason Dollar drops significantly below the value of the US
Dollar the value could quickly drop to zero making the minted money worthless.

Once the minting is accepted by 100% of the live nodes the new currency is
divided between the miner based on the number of shares they've mined.

## Banning nodes

If a node is unreachable or is preventing the network from reaching consensus
that node could be banned from the network. At any time any node can vote to ban
any other node. If all other nodes agree to ban that node the banning is banned
and no longer included in consensus.

Groups of nodes can also be voted banned. If a consensus among those nodes not
in the group is reached the group is banned.
