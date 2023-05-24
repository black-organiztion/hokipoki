$(document).ready(function(){
	/* tab공통 */
	//대메뉴 탭의 a 태그의 페이지 이동을 방지하고 탭으로 기능
	var $tab = $(".tab_menu").not(".clickable").children("li").children("a");
	  
	//각 .tabmenu의 첫번째 메뉴에 addClass(on);
	$(".tab_menu").not(".clickable").each(function(index, item){
		$(item).children("li").eq(0).addClass("on");
	});
	//각 .tab_conts의 첫번째 메뉴에 addClass(on);
	$(".tab_conts").each(function(index, item){
		$(item).children("div").eq(0).addClass("on");
	});
	
	//탭메뉴의 선택한 탭의 addClass(on);
	$tab.on("click focus", function (e) {
		e.preventDefault();
		//tab
		$(this).parent("li").siblings().removeClass("on");
		$(this).parent("li").addClass("on");

		//content
		$(".tab_conts > div").removeClass("on");
		//selected menu
		var selMenu = $(this).attr("href");
		$(selMenu).addClass("on"); 
	  
	});
	
	//$(".list .list_body").getNiceScroll().resize();
  	//$(".list .list_body").niceScroll();
	 $(".list .list_body").niceScroll({cursorwidth: '8px', zindex: 999, cursorcolor:'rgba(0,0,0,0.2)' });
	
	/* filter 전체 체크 액션*/
	
});


/* 레이어 show/hide */
function lyOn(btn){
	

	var btnId = btn.id; //클릭한 요소의 id
	var lyId = "ly_"+(btnId.replace("btn_","")); //id값에서 필요한 문자열 추출 후 만든 문자열로 새로운 id값으로 사용
	var lyTop = ($("#"+btnId).offset().top) + ($("#"+btnId).outerHeight()) + 4;
	var lyLeft = $("#"+btnId).offset().left;

	$("#"+btnId).addClass("on");
	$('#'+lyId).css({
		"top":lyTop,
		"left":lyLeft
		});
	$('#'+lyId).show();
	
}
/* 	
function selectLy(btn){
	var lyId = btn.closest(".ly").id;
	lyOff(lyId);
}
 */
function lyOff(btn){
	var lyId = btn.closest(".ly").id;
	var btnId = "btn_"+(lyId.replace("ly_",""));
	//console.log(btnId);
	$("#"+btnId).removeClass("on");
	$('#'+lyId).hide();
}


/* form 읽기/쓰기 전환 */
function modeEdit(formId){//수정모드로 만들기
	var targetForm = $("#"+formId);
	targetForm.removeClass("modeView").addClass("modeEdit");
	targetForm.find(".frm_control").attr("disabled",false); //.frm_control(input)에 disabled 속성을 없애 수정 가능하게 함

	/*
	input중 공구상태와 등록일은 사용자가 직접입력하는 것이 아니므로 modeEdit/modeView와 상관없이 처음부터 readonly 속성을 줘서 읽을 수만 있게함
	=>css로 .noEdit클래스를 사용해 사용자에게 readonly상태일 때와 disabled상태일 때가 똑같이 보이도록 함 
	*/
	
	$("#btn_edit").hide();
	$("#btn_save").show();
	$("#btn_cancel").show();
}

function modeView(formId){//보기모드로 만들기
	var targetForm = $("#"+formId);
	//form 안의 input을 초기화
	targetForm.each(function() {
		  this.reset();
	});
	
	targetForm.removeClass("modeEdit").addClass("modeView");
	targetForm.find(".frm_control").attr("disabled",true);//.frm_control(input)에 disabled 속성을 줘서 수정할 수 없게 함.

	$("#btn_edit").show(); //수정버튼을 보임
	$("#btn_save").hide(); //저장버튼을 숨김
	$("#btn_cancel").hide(); //취소버튼을 숨김
}

function formReset(formId){
	var targetForm = $("#"+formId).find("form");
	
	//console.log(targetForm);

	//form 안의 input을 초기화
	targetForm.each(function() {
		  this.reset();
	});
}
	