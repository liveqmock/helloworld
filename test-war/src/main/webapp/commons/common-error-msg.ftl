<#--  共用 images 路径    -->
<#assign imgSrc="${ctx}/style/default/images">
<head>
<title>易付宝</title>
<link href="${ctx}/style/default/css/layout_portal.css?v=${eppVersion}" rel="stylesheet" type="text/css" />
<link href="${ctx}/style/default/css/reset_portal.css?v=${eppVersion}" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="payList">
        <div class="payInfo" style="height:70px"></div>
        <!-- title end -->
                <div class="errorNote" style="width:798px;margin:auto">
                        <div class="errorIcon">
					<strong style="color:red;font-size:19px">${errorMsg} </strong>
				        <p class="other" style="margin-top:40px">您可能需要：<a href="/epp-epw/useraccount/user-account!initUserAccount.action">返回我的易付宝</a></p>
			</div>
                </div>
</body>        