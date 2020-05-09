# Blockchain-Based Smart Contracts

## Purpose

This software repository is a collective of smart contracts which are deployable on blockchain infrastructure. It’s purpose is to provide the public some insight on our R&D work.

## What are smart contracts

Smart contracts are a set of rules written in a specific programming language that can be deployed on top of a decentralized distributed network layer. One of the advantages of having a this kind of infrastructure layer is that once the contract is deployed, it cannot be deleted or even modified, and it will self-execute according to the rules it was programmed with.

There are many kinds of distributed ledger technologies, the first ever created was the Bitcoin Blockchain, in fact people now commonly refer to all these kind of distributed ledgers as "blockchains".

There are many differences between various blockchain implementations, but what interests us more here for the sake of understanding smart contracts is the degree of Turing-completeness that the blockchain supports for its built-in scripting language. The Bitcoin Blockchain is turing-incomplete, meaning it can only encode a small and very-specific set of instructions/algorithms (an example of non turing-complete machine is the calculator, which can only do a set of operations). Turing-incomplete languages cannot encode complex tasks but on the flipside they are very secure. Security comes from the fact that turing-incomplete machines do not offer to an attacker too much ability to manipulate the flow of the data, so they stay fairly safe.

Other than the Bitcoin Blockchain there are numerous other ones, but many are just replicas of it with only minor twists. The most notable successor is Ethereum because it enabled a Turing-complete language to be used to create custom algorithms that execute in this decentralized trustless environment. This is how smart contracts were born, and the language that still today allows you to write smart contracts in Ethereum is called Solidity. Examples of ethereum smart contracts can be found in the `./ethereum-solidity` directory.

Unfortunately, but expectedly, the dark side of having a turing complete language soon manifested through hacks and major manipulations to smart contract systems (google the "DAO hack" for example). This even resulted in scary headlines across many news outlets.

Understanding balance and tradeoffs between turing-completeness and security is fundamental when picking the right blockchain for accomplishing a task.

Another promising blockchain for smart contract creation and deployment is called Zilliqa. Zilliqa wants to be an infrastructure like Ethereum with smart contract capabilities, but with a much stronger security mindset.

To achieve security at the innermost-level of the smart contracts the Zilliqa team developed a language called "SCILLA" (Smart Contract Intermediate Level LAnguage), which provides a lot of type-checking and safe programming rules to identify and pinpoint security vulnerabilities as the contract is being developed.

You can find examples of Zilliqa smart contracts in the `./zilliqa-scilla` directory.

## Benefits of Smart Contracts

This technology can be a game changer for automating any kind of trust-based process and at the same time potentially remove a expensive/slow intermediary.
