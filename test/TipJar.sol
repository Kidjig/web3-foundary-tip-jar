// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TipJar.sol";

contract TipJarTest is Test {
    TipJar public tipJar;
    address public owner = address(1);
    address public tipper1 = address(2);
    address public tipper2 = address(3);

    function setUp() public {
        vm.prank(owner);
        tipJar = new TipJar();
    }

    function testTip() public {
        vm.deal(tipper1, 1 ether);
        vm.prank(tipper1);
        tipJar.tip{value: 0.1 ether}();
        
        emit log_uint(tipJar.totalTips());
        
        vm.prank(tipper1);
        emit log_uint(tipJar.getMyTips());
        
        assertEq(tipJar.totalTips(), 0.1 ether);
        
        vm.prank(tipper1);
        assertEq(tipJar.getMyTips(), 0.1 ether);
    }

    function testWithdraw() public {
        vm.deal(tipper1, 1 ether);
        vm.prank(tipper1);
        tipJar.tip{value: 0.5 ether}();

        vm.prank(owner);
        uint256 initialBalance = owner.balance;
        tipJar.withdraw();
        assertEq(owner.balance, initialBalance + 0.5 ether);
        assertEq(tipJar.totalTips(), 0);
    }

    function testMultipleTippers() public {
        vm.deal(tipper1, 1 ether);
        vm.deal(tipper2, 1 ether);

        vm.prank(tipper1);
        tipJar.tip{value: 0.3 ether}();

        vm.prank(tipper2);
        tipJar.tip{value: 0.2 ether}();

        assertEq(tipJar.totalTips(), 0.5 ether);
        vm.prank(tipper2);
        assertEq(tipJar.getMyTips(), 0.2 ether);
    }
}