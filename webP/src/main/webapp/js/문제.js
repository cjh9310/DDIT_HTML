function proc1(){
	let sum = 0;
	for(let i=1; i<=10; i++){
		sum += i;
	}
	document.getElementsByTagName('div')[0].innerText = sum;
}

//1~200까지 짝수의 합
function proc2(){
	let sum = 0;
	//방식1
	/*for(let i=2; i<=200; i+=2){
		sum += i;
	}*/
	//방식2
	/*for(let i=1; i<=200; i++){
		if(i%2 == 0){	//나머지 값이 0인 항목만 sum에 대입
			sum += i;
		}
	}*/
	//방식3(continue 사용)
	for(let i=1; i<=200; i++){
		if(i%2 != 0) continue;
		sum += i;
	}
	document.getElementsByTagName('div')[1].textContent = sum;
}

//입력받은 누적 값을 0입력시 출력
function proc3(){
	
	let sum = 0;
	let str = "";
	while(true){
		let a = parseInt(prompt("값을 입력하세요")); //return string -> int
		if(a == 0) break;
		sum += a;
		str += a + " ";
	}
	let result = `입력한 값 : ${str} <br>`;
	result += `결과 : ${sum}`;
	document.getElementsByTagName('div')[2].innerHTML = result;
} 
 
//다중for문으로 1~10까지의 두 수의 합이 3의 배수인 값 출력(continue)
function proc4(){
  	
	let result = "";

	for(i=1; i<=10; i++){
	  for(k=1; k<=10; k++){
		if((i+k)%3 != 0) continue;
//		result += i + "+" + k + "=" + (i+k) + "<br>";
		result += `${i} + ${k} = ${i+k} <br>`;
	  }
	}
	document.getElementsByTagName('div')[3].innerHTML = result;
}

// 1~100까지 수 중 2의 배수이자, 3의 배수인 값 출력
function proc5(){
	let result = "";
	for(i=1; i<=100; i++){
		if(i%2 == 0 && i%3 == 0){
//			result += i + " ";
			result += `${i} `;
		}
	}
	document.getElementsByTagName('div')[4].innerHTML = result;
}

//두수의 합이 100 이상/미만인 값 들 출력 (두 수가 0일때 종료, continue)
function proc6(){
	let str1 = "100이상의 값들 <br>";
	let str2 = "100미만의 값들 <br>";

	while(true){
		let a = parseInt(prompt("값 1 입력"));
		let b = parseInt(prompt("값 2 입력"));
		
		if(a == 0 && b == 0) break;
		
		let sum = a + b;	//100이상? 미만?
		if(sum < 100){
			//100미만의 값을 출력
			str2 += `${a} ${b} <br>`;
			continue;
		}
		//100이상의 값을 출력
		str1 += `${a} ${b} <br>`;
	}	
	document.getElementsByTagName('div')[5].innerHTML = str1;
	document.getElementsByTagName('div')[5].innerHTML += str2;
}




