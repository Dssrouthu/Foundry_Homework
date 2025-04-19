// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Books.sol";

contract TestBooks is Test {
    Books public books;

    function setUp() public {
        books = new Books("Programming Foundry", "Sampath Routhu", 100);
    }

    function test_get_book() public {
        Books.Book memory book = books.get_book();
        assertEq(keccak256(bytes(book.title)), keccak256(bytes("Programming Foundry")));
        assertEq(keccak256(bytes(book.author)), keccak256(bytes("Sampath Routhu")));
        assertEq(book.pages, 100);
    }

    function test_update_pages() public {
        books.update_pages(250);
        Books.Book memory updatedBook = books.get_book();
        assertEq(updatedBook.pages, 250);
    }
}