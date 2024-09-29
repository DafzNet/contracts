// scripts/deploy.js

const { ethers } = require("hardhat");

async function main() {
    // Get the contract factory for the Procurement contract
    const Procurement = await ethers.getContractFactory("Procurement");

    // Deploy the contract
    const procurement = await Procurement.deploy();

    // Wait for the deployment to be confirmed
    await procurement.deployed();

    console.log("Procurement contract deployed to:", procurement.address);
}

// Run the main function and handle errors
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
