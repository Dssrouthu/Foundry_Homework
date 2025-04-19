// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "../src/Books.sol";

contract TestBooks is Test {
    Books public books;

    function setUp() public {
        // Deploy the contract with initial values matching the deployment script
        books = new Books("Programming Foundry", "Sampath Routhu", 100);
    }

    function test_get_book() public view {
        Books.Book memory book = books.get_book();
        // Use keccak256 for string comparisons, since assertEq cannot compare strings directly
        assertEq(keccak256(bytes(book.title)), keccak256(bytes("Programming Foundry")));
        assertEq(keccak256(bytes(book.author)), keccak256(bytes("Sampath Routhu")));
        assertEq(book.pages, 100);
    }
    
    function test_updatePages() public {
        // Update pages to a new value, e.g., 200
        books.update_pages(200);
        Books.Book memory book = books.get_book();
        assertEq(book.pages, 200);
    }
}