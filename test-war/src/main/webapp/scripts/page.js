$(function(){
	defaultPageSize = $('#_pageSize').val();
});
function nextPage(formId) {
	checkPageSize();
	var total = Number($('#page_pages').val());
	var current = Number($('#page_currentPage').val());
	if (current < total || $('#page_pageSize').val() != defaultPageSize) {
		$('#page_currentPage').val(current + 1);
	} else {
		//$('#currentPage').val(total);
		return;
	}
	if(!formId){
		$("form:first").append($('#page_currentPage'));
		$("form:first").append($('#page_pageSize'));
		$("form:first").submit();
	}else{
		$('#' + formId).append($('#page_currentPage'));
		$("form:first").append($('#page_pageSize'));
		$('#' + formId).submit();
	}
}

function frontPage(formId) {
	checkPageSize();
	var current = Number($('#page_currentPage').val());
	if (current > 1 || $('#page_pageSize').val() != defaultPageSize) {
		$('#page_currentPage').val(current - 1);
	} else {
		//$('#currentPage').val(1);
		return;
	}
	if(!formId){
		$("form:first").append($('#page_currentPage'));
		$("form:first").append($('#page_pageSize'));
		$("form:first").submit();
	}else{
		$('#' + formId).append($('#page_currentPage'));
		$("form:first").append($('#page_pageSize'));
		$('#' + formId).submit();
	}
}

function forwardTo(page, formId) {
	checkPageSize();
	if (!page){
		return;
	}
	if(isNaN(page)){
		return;
	}
	page = parseInt(page);
	if ((!page || page < 1 || page==$('#page_currentPage').val() || page > $('#page_pages').val()) && $('#page_pageSize').val() == defaultPageSize) {
		return;
	}else {
		//$('#currentPage').val(page);
		$('#page_currentPage').val(page);
	}
	if(!formId){
		$("form:first").append($('#page_currentPage'));
		$("form:first").append($('#page_pageSize'));
		$("form:first").submit();
	}else{
		$('#' + formId).append($('#page_currentPage'));
		$("form:first").append($('#page_pageSize'));
		$('#' + formId).submit();
	}
}

function forward(formId) {
	var page = $('#forwardPage').val();
	forwardTo(page,formId);
}

function checkPageSize(){
	if(isNaN($('#_pageSize').val()) || $('#_pageSize').val()<5 || $('#_pageSize').val()>200){
		$('#page_pageSize').val(defaultPageSize);
	}else{
		$('#page_pageSize').val($('#_pageSize').val());
	}
}