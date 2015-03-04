<#ftl strip_whitespace=true>
<#macro updownPage path="page" formId=''>
	<div class="pageNu"> 
	
	<#assign page=springMacroRequestContext.getModel()[path]>
    <#if page?is_hash>
    <#if page.pages ==0>
   	暂无数据	
    <#else>
        <span>每页<input type="text" id="_pageSize" value="${page.pageSize}" style="width:20px">条</span>
        <a href="javascript:void(0)" onclick="javascript:forwardTo(1<#if formid??> ,formId</#if>)" class="pageUp"><span>u</span></a>
        <span class="page">
        	<a href="javascript:void(0)" onclick="javascript:forwardTo(1<#if formid??> ,formId</#if>)">首页</a>
        	<a href="javascript:void(0)" onclick="javascript:frontPage(<#if formid??>formId</#if>)">上一页</a>
        	<a href="javascript:void(0)" onclick="javascript:nextPage(<#if formid??>formId</#if>)">下一页</a>
        	<a href="javascript:void(0)" onclick="javascript:forwardTo(${page.pages}<#if formid??> ,formId</#if>)">末页</a>
        </span>
        <a href="javascript:void(0)" onclick="javascript:forwardTo(${page.pages}<#if formid??> ,formId</#if>)"class="pageDown"><span>d</span></a>
        <span>第${page.currentPage}页/共${page.pages}页</span>
        <span>到<input id="forwardPage" style="width:20px" type="text">页</span>
        <input type="hidden" id="page_currentPage" name="currentPage" value="${page.currentPage}">
        <input type="hidden" id="page_pageSize" name="pageSize" value="${page.pageSize}">
        <input type="hidden" id="page_pages" name="pages" value="${page.pages}">
        <a href="javascript:void(0)" onclick="javascript:forward(<#if formid??>formId</#if>)" class='pageSel' style='font-size:13px; font-weight:bold;'>Go</a></span></a>
    </#if>
    <#else>
           请查询
    </#if>
    </div>
</#macro>

<#macro page path="page" formId=''>
    <div class="pageNu"> 
    <#if springMacroRequestContext.getModel()[path] ??>
    <#assign page=springMacroRequestContext.getModel()[path]>
    <#if page.pages ==0>
    暂无数据    
    <#else>
        <span>每页<input type="text" id="_pageSize" value="${page.pageSize}" style="width:20px">条</span>
        <a href="javascript:void(0)" onclick="javascript:forwardTo(1<#if formid??> ,formId</#if>)" class="pageUp"><span>u</span></a>
        <#assign pageBar = page.pageBar/>
        <#if pageBar.hasPreviousBar()>....</#if>
        <span class="page">
            <#list pageBar.clickBlocks as item>
            <a href="javascript:void(0)" onclick="javascript:forwardTo(${item}<#if formid??> ,formId</#if>)" <#if page.currentPage==item>class='pageSel'</#if>>${item}</a>
            </#list>
        </span>
        <#if pageBar.hasNextBar()>....</#if>
        <a href="javascript:void(0)" onclick="javascript:forwardTo(${page.pages}<#if formid??> ,formId</#if>)"class="pageDown"><span>d</span></a>
        <span>第${page.currentPage}页/共${page.pages}页</span>
        <span>到<input id="forwardPage" style="width:20px" type="text">页</span>
        <input type="hidden" id="page_currentPage" name="currentPage" value="${page.currentPage}">
        <input type="hidden" id="page_pageSize" name="pageSize" value="${page.pageSize}">
        <input type="hidden" id="page_pages" name="pages" value="${page.pages}">
        <a href="javascript:void(0)" onclick="javascript:forward(<#if formid??>formId</#if>)" class='pageSel' style='font-size:13px; font-weight:bold;'>Go</a></span></a>
    </#if>
    <#else>
           请查询
    </#if>
    </div>
</#macro>

<#macro select list listKey listValue path emptyOption=true attributes="" emptyValue="">
    <@spring.bind path/>
    <select name="${spring.status.expression}" ${attributes}>
        <#if emptyOption><option value=''>${emptyValue}</option></#if>
        <#list list as item>
        <option value='${item[listKey]}' <@spring.checkSelected item[listKey]/>>${item[listValue]}</option><#rt/>
        </#list>
    </select>
</#macro>

<#macro message path="messageHolder">
<#if springMacroRequestContext.getModel()[path]??>
    <#assign messageHolder=springMacroRequestContext.getModel()[path]/>
    <#if messageHolder.errors??>
    <div class="error">
        <#list messageHolder.errors as error>
            <!--<img src="${ctx}/images/iconWarning.gif" alt="Warning"/><s:property/><br/>-->
            <div class="warning icon_error">${error}</div>
        </#list>
    </div>
    </#if>
    
    <#if messageHolder.messages??>
    <div class="message">
        <#list messageHolder.messages as message>
            <!--<img src="${ctx}/images/iconWarning.gif" alt="Warning"/><s:property/><br/>-->
            <div class="warning icon_ok">${message}</div>
        </#list>
    </div>
    </#if>
</#if>
</#macro>

<#macro token name="com.suning.epp.core.Token">
    <input type='hidden' name = "${name}" value="${saveToken()}">
</#macro>