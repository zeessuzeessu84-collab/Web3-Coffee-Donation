hhcfgconst hre = require("hardhat");

async function main() {
  const Coffee = await hre.ethers.getContractFactory("Coffee");
  const coffee = await Coffee.deploy(
  await coffee.deployed
  console.log(offee Contract deployed to:", coffee.addres
main().catch((er) 
  console.error(err
  process.exitCo = 1;
});
