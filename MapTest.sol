pragma solidity >=0.7.0 <0.9.0;

contract MapTest {
    
  struct Payment {
      uint amount;
      uint timestamps;
  }
  
  struct Balance {
      uint totalBalance;
      uint numPayments;
      mapping(uint => Payment) payments;
  }
    
  mapping(address => uint) public balanceReceived;
  
  function getBalance() public view returns(uint){
      return address(this).balance;
  }
  
  function sendMoney() public payable{ 
      balanceReceived[msg.sender] += msg.value;
  }
  
  function withdrawAll() public {
    uint balanceToSend = balanceReceived[msg.sender];
    balanceReceived[msg.sender] = 0;
    payable(msg.sender).transfer(balanceToSend);
  }
}