$(document).ready(function(){
		//表格悬停变色
		$("table.list tbody tr").mouseover(function(){
			$(this).addClass("even_over");
		}).mouseout(function(){
			$(this).removeClass("even_over");
		});
		  
		$("table.list tbody tr:nth-child(odd)").addClass("odd");//单数行样式
		$("table.list tbody tr:nth-child(even)").addClass("even");//双数行样式
});