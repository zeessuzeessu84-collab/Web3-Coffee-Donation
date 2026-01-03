hhcfgconst hre = require("hardhat");

async function main() {
  const Coffee = await hre.ethers.getContractFactory("Coffee");
  const coffee = await Coffee.deploy();

  await coffee.deployed
  console.log("Coffee Contract deployed to:", coffee.addres
main().catch((error) =>
  console.error(error);
  process.exitCo = 1;
});
