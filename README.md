## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/DeployTipJar.s.sol:DeployTipJar --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Check total tips:

```shell
$ cast call <CONTRACT_ADDRESS> "totalTips()" --rpc-url <your_rpc_url>

```
### Send a tip (0.1 ETH):
```shell
$ cast send <CONTRACT_ADDRESS> "tip()" --value 0.1ether --private-key <your_private_key> --rpc-url <your_rpc_url>
```

### Check your personal tip amount:
```shell
$ cast call <CONTRACT_ADDRESS> "getMyTips()" --from <YOUR_ADDRESS> --rpc-url <your_rpc_url>
```

### Withdraw tips (only owner):
```shell
$ cast send <CONTRACT_ADDRESS> "withdraw()" --private-key <OWNER_PRIVATE_KEY> --rpc-url <your_rpc_url>

```


### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

### Contract Details
The TipJar contract allows users to send tips in ETH, which can be withdrawn by the contract owner. Key features include:

- **Sending tips**: Users can send tips to the contract by sending ETH to the contract address.
- **Checking total tips**: The contract keeps track of the total amount of tips sent to it.
- **Checking individual tip amounts**: Users can check their individual tip amount by calling the `getMyTips()` function.
- **Owner-only withdrawal**: Only the contract owner can withdraw all tips at once by calling the `withdraw()` function.

## Security
This contract is for educational purposes and has not been audited. Use at your own risk.

## License
This project is licensed under the MIT License.