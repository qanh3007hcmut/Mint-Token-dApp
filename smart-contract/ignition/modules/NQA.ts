import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const NQAModule = buildModule("NQAModule", (m) => {
  // Deploy NQA token with an initial supply of 1,000,000 tokens (with 18 decimals)
  const initialCap = BigInt(1000000) * BigInt(10 ** 18);
  
  const nqaToken = m.contract("NQA", [initialCap]);

  return { nqaToken };
});

export default NQAModule;