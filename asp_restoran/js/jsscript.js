/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Reporuka(){
	var polje=document.getElementById("polje").value.length;
		broj=document.getElementById("polje_ispod");

	
	if(polje>300 || polje<5){
		broj.style.color="#ff0000";
		broj.innerHTML=polje;

	}
	else{
		broj.innerHTML=polje;
		broj.style.color="#000000";
	
	}
}


