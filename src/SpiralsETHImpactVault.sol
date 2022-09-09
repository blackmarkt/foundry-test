pragma solidity ^0.8.15;

import "lib/rocket-pool/RocketStorageInterface.sol";
import "lib/rocket-pool/RocketDepositPoolInterface.sol";
import "lib/rocket-pool/RocketTokenRETHInterface.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Example {
    event ConsoleLog(address test);

    RocketStorageInterface rocketStorage = RocketStorageInterface(address(0));
    mapping(address => uint256) balances;

    constructor(address _rocketStorageAddress) {
        rocketStorage = RocketStorageInterface(_rocketStorageAddress);
    }

    function deposit() external payable {
        // Check deposit amount
        require(msg.value > 0, "Invalid deposit amount");
        // Load contracts
        address rocketDepositPoolAddress = rocketStorage.getAddress(keccak256(abi.encodePacked("contract.address", "rocketDepositPool")));
        // address rocketDepositPoolAddress = getRocketDepositAddress();
        RocketDepositPoolInterface rocketDepositPool = RocketDepositPoolInterface(rocketDepositPoolAddress);
        // RocketDepositPoolInterface rocketDepositPool = RocketDepositPoolInterface(rocketDepositPoolAddress);
        address rocketTokenRETHAddress = rocketStorage.getAddress(keccak256(abi.encodePacked("contract.address", "rocketTokenRETH")));
        // address rocketTokenRETHAddress = getRocketTokenRETHAddress();
        RocketTokenRETHInterface rocketTokenRETH = RocketTokenRETHInterface(rocketTokenRETHAddress);
        // Forward deposit to RP & get amount of rETH minted
        uint256 rethBalance1 = rocketTokenRETH.balanceOf(address(this));
        rocketDepositPool.depositEther{value: msg.value}();
        uint256 rethBalance2 = rocketTokenRETH.balanceOf(address(this));
        require(rethBalance2 > rethBalance1, "No rETH was minted");
        uint256 rethMinted = rethBalance2 - rethBalance1;
        // Update user's balance
        balances[msg.sender] += rethMinted;
    }

    // After 24 hours it's possible to transfer the tokens
    function withdraw() external {
        // Load contracts
        address rocketTokenRETHAddress = rocketStorage.getAddress(keccak256(abi.encodePacked("contract.address", "rocketTokenRETH")));
        RocketTokenRETHInterface rocketTokenRETH = RocketTokenRETHInterface(rocketTokenRETHAddress);
        // Transfer rETH to caller
        uint256 balance = balances[msg.sender];
        balances[msg.sender] = 0;
        require(rocketTokenRETH.transfer(msg.sender, balance), "rETH was not transferred to caller");
    }

    // function getRocketDepositAddress() internal returns(address) {
    //     // address test = rocketStorage.getAddress(keccak256(abi.encodePacked("contract.address", "rocketDepositPool")));
    //     // emit ConsoleLog(test);
    //     // return(test);
    //     return(rocketStorage.getAddress(keccak256(abi.encodePacked("contract.address", "rocketDepositPool"))));
    // }

    // function getRocketTokenRETHAddress() internal returns(address) {
    //     return(rocketStorage.getAddress(keccak256(abi.encodePacked("contract.address", "rocketTokenRETH"))));
    // }

}
