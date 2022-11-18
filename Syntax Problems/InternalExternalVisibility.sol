// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract A{

    uint private a;

    function f1(uint x, uint z) internal returns (uint){
        return x + z; }

    function f2(uint y) private  returns(uint b){
        return 6*y ; }
    }

contract B {
    function f3() public{
        A conttA = new A();
        uint var1 = conttA.f2(89);  // compilation error 
    }
}

contract C is A {
    function f4() public {
        A contA = new A();
        uint var2 = f1(74, 51);  
    } 
}