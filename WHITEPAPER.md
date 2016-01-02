## Mason Miners and Mason Shares

Mason Miners mine Mason Shares to which will in turn pay dividends and are used
to keep the network secure.

Mason Shares are mined by using the following inputs:

Property |  Description | Example Value
---------|---------------|--------------
Last Hash | The previous hash in the work chain |320c63b05ab3ddc45ca6b54dc414b56a2ed64fac
Public Key | The Miner's public key which will be used to sign transactions and collect dividends | b110bf3d84bacb1cfefb805e0551c4d0c470276836147ad8f5311ea34b790c3b
Nonce | An integer which is incremented until the target is hit | 0

Values are encoded into a binary format using a [Protocol
Buffer](https://developers.google.com/protocol-buffers/?hl=en) and doubled
hashed using [SHA256](https://en.wikipedia.org/wiki/SHA-2). If
that hash value is smaller than the targeted value the miner publishes the hash
to the network and is rewarded one
Mason Share. If the hash value is larger than the targeted value the miner
increments the Nonce value and tries again.

## Transaction Verification

Transactions are created using the following inputs

Property |  Description | Required?| Example Value
---------|--------------|----------|--------------
From Address | The address of the sender | _optional_ | mason$mason.money
From Public Key | The public key of the sender | __required__ | df137735f033534e62849164d28e3f8e8a91263f074de7d037392faccfdc5e20
To Address | The address of the recipient | _optional_ | bob$mason.money
To Public Key | The public key of the recipient | __required__ | 55a920091fa6095eda010ddf8c364dff22a1adf7ce4cc68cf8731c2ae2773b66
Amount | The amount to be transacted in Mason dollars | __required__ | 1.50 |

These inputs are then serialized into a binary format using a protocol buffer.
This data is signed using the sender's private key and submitted to a
node.

To collect dividends miners must also run their own node. When a transaction comes
in the each miner will sign the transaction and relay it to it's neighboring
nodes. By signing the transaction that Miner is voting that that transaction
should be accepted into the ledger. Miners get one vote per Mason Share. Once
the vote exceeds 50% that transaction becomes valid and can not be reversed.

## Dividends

At 00:00:00 CST every day dividends are payed out. Dividends are calculated by
summing all open orders above $1 USD with a ceiling to prevent massive
inflation. The dividends are divided among the miners based on the number of
shares they control.


## Adding and removing miners
Miners are both added and removed at  At 00:00:00 CST as well. If new shares
have been mined those miners will be added to the network. If a miner has not
signed a transaction in the last 24 hours that miner will be banned permanently.
