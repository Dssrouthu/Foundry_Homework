// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Books.sol";

contract TestBooks is Test {
    Books public books;

    function setUp() public {
        books = new Books("Programming Foundry", "sampath routhu", 100);
    }

    function test_get_book() public view{
        Books.Book memory book = books.get_book();
        assertEq(book.title, "Programming Foundry");
        assertEq(book.author, "sampath routhu");
        assertEq(book.pages, 100);
    }

    function test_update_pages() public {
        books.update_pages(250);
        Books.Book memory updatedBook = books.get_book();
        assertEq(updatedBook.pages, 250);
    }
}