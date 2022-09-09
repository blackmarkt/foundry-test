// SPDX-License-Identifier: Apache-2.0
// https://docs.soliditylang.org/en/v0.8.10/style-guide.html
pragma solidity 0.8.11;

import "forge-std/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";

// import the Rocket Pool interfaces

contract ImpactETHVaultTest {
    // address internal stCeloTokenAddress =
    //     0xC668583dcbDc9ae6FA3CE46462758188adfdfC24;
    // address internal stCeloManagerAddress =
    //     0x0239b96D10a434a56CC9E09383077A0490cF9398;
    // address internal stCeloAccountAddress =
    //     0x4aAD04D41FD7fd495503731C5a2579e19054C432;
    // address internal cUSDLendingPoolAddress =
    //     0x970b12522CA9b4054807a2c5B736149a5BE6f670;
    // address internal mcUSDTokenAddress =
    //     0x918146359264C492BD6934071c6Bd31C854EDBc3;

    // IERC20 c_stCeloToken;
    // IManager c_stCeloManager;
    // IAccount c_stCeloAccount;
    // IMoolaLendingPool c_moolaCUSDLendingPool;
    // IMoolaAToken c_mcUSD;
    // wmcUSD c_wmcUSD;

    // SPRL c_sprl;
    // ImpactVaultManager c_impactVaultManager;
    // SpiralsCeloImpactVault c_spCeloVault;
    // SpiralsCUSDImpactVault c_spCUSDVault;

    // uint256 public constant initialSupply = 10000 ether;

    // function setUpEnv() public virtual override {
    //     console.log("");
    //     console.log(
    //         "======================= TEST SETUP ========================"
    //     );
    //     super.setUpEnv();

    //     // Initialize stCELO contracts.
    //     c_stCeloToken = IERC20(stCeloTokenAddress);
    //     vm.label(stCeloTokenAddress, "stCELO.Token");
    //     c_stCeloManager = IManager(stCeloManagerAddress);
    //     vm.label(stCeloManagerAddress, "stCELO.Manager");
    //     c_stCeloAccount = IAccount(stCeloAccountAddress);
    //     vm.label(stCeloAccountAddress, "stCELO.Account");

    //     // Initialize Moola contracts.
    //     c_moolaCUSDLendingPool = IMoolaLendingPool(cUSDLendingPoolAddress);
    //     vm.label(cUSDLendingPoolAddress, "Moola.LendingPool");
    //     c_mcUSD = IMoolaAToken(mcUSDTokenAddress);
    //     vm.label(mcUSDTokenAddress, "Moola.mcUSD");

    //     // Create 1:1 CELO-stCELO supply conditions.
    //     vm.mockCall(
    //         address(c_stCeloToken),
    //         abi.encodeWithSelector(c_stCeloToken.totalSupply.selector),
    //         abi.encode(initialSupply)
    //     );

    //     // Initialize SPRL token & ImpactVaultManager.
    //     changePrank(owner);

    //     console.log("Initializing wmcUSD...");
    //     c_wmcUSD = new wmcUSD();
    //     c_wmcUSD.initialize(address(c_mcUSD));
    //     vm.label(address(c_wmcUSD), "Non-rebasing mcUSD");

    //     console.log("Initializing SPRL token...");
    //     c_sprl = new SPRL();
    //     c_sprl.initialize();
    //     vm.label(address(c_sprl), "SPRL");

    //     console.log("Initializing ImpactVaultManager...");
    //     c_impactVaultManager = new ImpactVaultManager();
    //     c_impactVaultManager.initialize(address(c_sprl));
    //     vm.label(address(c_sprl), "ImpactVaultManager");

    //     c_sprl.grantRole(c_sprl.MINTER_ROLE(), address(c_impactVaultManager));
    //     c_sprl.renounceRole(c_sprl.MINTER_ROLE(), owner);

    //     // Initialize spCELO vault.
    //     console.log("Initializing spCELO vault...");
    //     c_spCeloVault = new SpiralsCeloImpactVault();
    //     c_spCeloVault.initialize(
    //         address(c_stCeloToken),
    //         address(c_stCeloManager),
    //         address(c_celoRegistry),
    //         address(c_impactVaultManager)
    //     );
    //     vm.label(address(c_spCeloVault), "SpiralsCeloImpactVault");
    //     console.log("Created vault at", address(c_spCeloVault));

    //     // Initialize spcUSD vault.
    //     console.log("Initializing spcUSD vault...");
    //     c_spCUSDVault = new SpiralsCUSDImpactVault();
    //     c_spCUSDVault.initialize(
    //         address(c_moolaCUSDLendingPool),
    //         address(c_wmcUSD),
    //         address(c_celoRegistry),
    //         address(c_impactVaultManager)
    //     );
    //     vm.label(address(c_spCUSDVault), "SpiralsCUSDImpactVault");
    //     console.log("Created vault at", address(c_spCUSDVault));

    //     // Register vaults.
    //     console.log("Registering spCELO vault...");
    //     c_impactVaultManager.registerVault(address(c_spCeloVault));
    //     assertTrue(
    //         c_impactVaultManager.isRegisteredVault(address(c_spCeloVault))
    //     );
    //     console.log("Registering spcUSD vault...");
    //     c_impactVaultManager.registerVault(address(c_spCUSDVault));
    //     assertTrue(
    //         c_impactVaultManager.isRegisteredVault(address(c_spCUSDVault))
    //     );

    //     console.log("Initializing stCELO value (CELO supply)...");
    //     resetStCeloValue();
    //     console.log("Initializing wmcUSD value (cUSD supply)...");
    //     resetWmcUSDValue();
    // }

    // function resetStCeloValue() public {
    //     setStCeloValue(initialSupply);
    // }

    // function setStCeloValue(uint256 _newSupply) public {
    //     vm.mockCall(
    //         address(c_stCeloAccount),
    //         abi.encodeWithSelector(c_stCeloAccount.getTotalCelo.selector),
    //         abi.encode(_newSupply)
    //     );
    // }

    // function multiplyStCeloValue(uint256 _multiplier) public {
    //     uint256 totalAssetsBefore = c_stCeloAccount.getTotalCelo();
    //     setStCeloValue(totalAssetsBefore * _multiplier);
    // }

    // function resetWmcUSDValue() public {
    //     setWmcUSDValue(initialSupply);
    // }

    // function setWmcUSDValue(uint256 _newSupply) public {
    //     uint256 currentSupply = c_wmcUSD.totalAssets();

    //     if (_newSupply >= currentSupply) {
    //         depositWmcUSD(_newSupply - currentSupply);
    //     } else {
    //         withdrawWmcUSD(currentSupply - _newSupply);
    //     }

    //     assertCloseEnough(
    //         c_wmcUSD.totalAssets(),
    //         _newSupply,
    //         "wmcUSD vault assets after mint"
    //     );
    // }

    // function multiplyWmcUSDValue(uint256 _multiplier) public {
    //     uint256 totalAssetsBefore = c_wmcUSD.totalAssets();
    //     setWmcUSDValue(_multiplier * totalAssetsBefore);
    // }

    // function depositWmcUSD(uint256 _amountToDeposit) public {
    //     mintCUSD(owner, _amountToDeposit); // so owner balance doesn't change
    //     changePrank(owner);
    //     c_stableToken.approve(
    //         address(c_moolaCUSDLendingPool),
    //         _amountToDeposit
    //     );
    //     c_moolaCUSDLendingPool.deposit(
    //         address(c_stableToken),
    //         _amountToDeposit,
    //         address(c_wmcUSD),
    //         0
    //     );
    // }

    // function withdrawWmcUSD(uint256 _amountToWithdraw) public {
    //     vm.prank(address(c_wmcUSD));
    //     c_mcUSD.transfer(address(0), _amountToWithdraw);
    // }

    // function logYieldIndex(ImpactVault _vault, address _address) public view {
    //     console.log("------- logging yield index", _address);
    //     (
    //         uint256 amountYieldAssetALU,
    //         uint256 totalAssetVaultALU,
    //         uint256 accumulatedYield
    //     ) = _vault.yieldIndexMap(_address);
    //     console.log("   amountYieldAssetALU", amountYieldAssetALU);
    //     console.log("   totalAssetValueALU ", totalAssetVaultALU);
    //     console.log(
    //         "   totalAssetValueNow ",
    //         _vault.convertToAsset(totalAssetVaultALU)
    //     );
    //     console.log("   accumulatedYield   ", accumulatedYield);
    //     console.log("   TOTAL YIELD", _vault.getYieldCUSD(_address));
    //     console.log("----------------------------");
    // }
}
