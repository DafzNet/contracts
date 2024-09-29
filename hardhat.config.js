/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    version: "0.8.24",
  },
  networks: {
    ganache: {
      url: "http://127.0.0.1:8545",
      accounts: {
        mnemonic: "evil spoil elbow present canyon impulse myth doll hard access basket school",
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 20,
      },
    },
  },
};
