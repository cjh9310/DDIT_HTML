//리스트 데이터 가져오기

function listServer(page){
	
	//리스트 데이터와 페이징 데이터를 모두 가져올 예정.. 
	$.ajax({
		url : '/board/BoardList',	//context root 존재시 경로에 추가..
		//type : 'get',
		data :	'page=' + page,
		success:function(listData){
			
			//BS collapse-Accordion 게시판 예제 활용
			code = '<div class="panel-group" id="accordion">';
			
			$.each(listData.data, function(i,v){
				
				code += '<div class="panel panel-default">';
				code += '  <div class="panel-heading">';
				code += '    <h4 class="panel-title">';    
				code += '      <a idx="' + v.num + '" class="list" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num + '">';
				code += 		v.subject + '</a>';      
				code += '    </h4>';
				code += '  </div>';
//				code += '  <div id="collapse' + v.num + '" class="panel-collapse collapse in">';
				code += '  <div id="collapse' + v.num + '" class="panel-collapse collapse">';
				code += '    <div class="panel-body pbody">';
				code += '		<div class="p1">작성자 : ' + v.writer + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '									조회수 : ' + v.hit + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '									날짜 : ' + v.wdate + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '		</div>';
				code += '		<div class="p2">';
				code += '  			<input idx="' + v.num + '" type="button" name="modify" value="수정" class="action btn btn-warning btn-sm">';
				code += '			<input idx="' + v.num + '" type="button" name="delete" value="삭제" class="action btn btn-danger btn-sm">';
				code += '		</div>';
				code += '		<div class="p3">' + v.cont + '</div>';
				
				//댓글구간s
				code += '		<hr>';
				code += '		<p class="p4">';
				code += '		  <textarea cols="90"></textarea>';
				code += '		  <input idx="' + v.num + '" type="button" value="등록" name="reply" class="action btn btn-primary">';
				code += '		</p>';
				//댓글구간e
				
				code += '    </div>';
				code += '  </div>';
				code += '</div>';
			});
		    code += '</div>';
			
			//목록 출력하기
			$('#list').html(code);
			
			//페이지 리스트 출력하기
			
			//이전 버튼 출력
			pager = `<ul class="pager">`;
			pager += `<li><a href="#" class="prev">Prev</a></li>`;  
			pager += `</ul>`;
			
			//페이지 번호 출력
			pager += `<ul class="pagination pager">`;
			for(i=listData.sPage; i<=listData.ePage; i++){
			  pager += `  <li><a href="#" class="paging">${i}</a></li>`;
			}
			pager += `</ul>`;
			
			//다음 버튼 출력
			pager += `<ul class="pager">`;
			pager += `<li><a href="#" class="next">Next</a></li>`;  
			pager += `</ul>`;
			
			$('#pagelist').html(pager);
			
			
		},
		error:function(xhr){
			alert(xhr.status);
		},
		dataType :'json'
	});
	
}

$(function(){
	
	//페이지 번호 클릭 이벤트 
	$('#pagelist').on('click','.paging',function(){
		currentPage = $(this).text().trim();
		listServer(currentPage);
	});
	
	//이전 버튼 클릭 이벤트
	$('#pagelist').on('click','.prev',function(){
		let v_prev = $('.paging').first().text();
		if(v_prev == 1){
		  currentPage = v_prev;
		}else{
		  currentPage = v_prev - 1;
		}
		listServer(currentPage);
	});
	
	//다음 버튼 클릭 이벤트
	$('#pagelist').on('click','.next',function(){
	  let v_next = $('.paging').last().text();
	  currentPage = parseInt(v_next) + 1;
	  listServer(currentPage);
	});
	
	
});






