pragma solidity ^0.5.12;

interface FireControllerInterface {
    /**
     * @notice Marker function used for light validation when updating the fireController of a market
     * @dev Implementations should simply return true.
     * @return true
     */
    function isFireController() external view returns (bool);

    /*** Assets You Are In ***/

    function enterMarkets(address[] calldata FireTokens) external returns (uint[] memory);
    function exitMarket(address FireToken) external returns (uint);

    /*** Policy Hooks ***/

    function mintAllowed(address FireToken, address minter, uint mintAmount) external returns (uint);
    function mintVerify(address FireToken, address minter, uint mintAmount, uint mintTokens) external;

    function redeemAllowed(address FireToken, address redeemer, uint redeemTokens) external returns (uint);
    function redeemVerify(address FireToken, address redeemer, uint redeemAmount, uint redeemTokens) external;

    function borrowAllowed(address FireToken, address borrower, uint borrowAmount) external returns (uint);
    function borrowVerify(address FireToken, address borrower, uint borrowAmount) external;

    function repayBorrowAllowed(
        address FireToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function repayBorrowVerify(
        address FireToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function liquidateBorrowAllowed(
        address FireTokenBorrowed,
        address FireTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function liquidateBorrowVerify(
        address FireTokenBorrowed,
        address FireTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function seizeAllowed(
        address FireTokenCollateral,
        address FireTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function seizeVerify(
        address FireTokenCollateral,
        address FireTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function transferAllowed(address FireToken, address src, address dst, uint transferTokens) external returns (uint);
    function transferVerify(address FireToken, address src, address dst, uint transferTokens) external;

    /*** Liquidity/Liquidation Calculations ***/

    function liquidateCalculateSeizeTokens(
        address FireTokenBorrowed,
        address FireTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}
