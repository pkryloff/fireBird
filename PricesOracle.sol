pragma solidity ^0.5.12;
import "./FireToken.sol";
interface PriceOracle {
    /**
     * @notice Indicator that this is a PriceOracle contract (for inspection)
     */
    function() external pure returns (bool);

    /**
      * @notice Get the underlying price of a FireToken asset
      * @param FireToken The FireToken to get the underlying price of
      * @return The underlying asset price mantissa (scaled by 1e18).
      *  Zero means the price is unavailable.
      */
    function getUnderlyingPrice(FireToken FireToken) external view returns (uint);
}
