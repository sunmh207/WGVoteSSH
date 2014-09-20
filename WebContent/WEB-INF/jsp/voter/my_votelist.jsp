<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<html:pageHead >
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">

</html:pageHead>
<body>
<html:pagetitle title="我的投票" />
<form id="searchForm" action="${root}/vote/my_vote.do">
<div style="float: left; padding-bottom: 0px;">
		&nbsp;投票名称       <input name="qryName" value='${qryName}' size="20">
	  <button class="user-search" onclick="javascript:goPage(1)">查询</button>
</div>
<html:pagination exportExcel="false"/>
</form>
<s:actionerror/>
<table width="100%" class="table" align="center" cellpadding="1" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
       <td width="40" align="center" class="td_header">序号</td>
       <td class="td_header">投票名称</td>
       <td class="td_header">开始时间</td>
       <td class="td_header">要求</td>
       <td class="td_header">投票说明</td>
       <td class="td_header">创建人</td>
       <td class="td_header">创建时间</td>
       <td class="td_header">类型</td>
       <td class="td_header">状态</td>
       <td class="td_header">操作</td>
     </tr>
	
	 <s:iterator value="objectList" status="st">
			<tr bgcolor="#FFFF00">
				<td align="center"><s:property value="%{#st.index+1}" /></td> 
				<td align="left"><s:property value="name"/></td>
				<td align="left"><s:property value="startDate"/> <s:property value="startHour"/>:<s:property value="startMinute"/></td>
				<td align="left"><s:property value="requirement"/></td>
				<td align="left"><s:property value="note"/></td>
				<td align="left"><s:property value="creator"/></td>
				<td align="left"><s:property value="createTime"/></td>
				<td align="left"><s:property value="type"/></td>
				<td align="left"><s:property value="statusTXT"/></td>
				<td align="center">
				<s:if test="type == \"推荐\"">
					<a class="ui_icon_person" href="${root}/vote/my_tj_candidate.do?vote.id=<s:property value="id"/>" >投票结果</a>&nbsp;&nbsp;
				</s:if>	
				<s:if test="type == \"评审\"">
					<a class="ui_icon_person" href="${root}/vote/my_ps_candidate.do?vote.id=<s:property value="id"/>" >投票结果</a>&nbsp;&nbsp;
				</s:if>	
				</td>
			</tr>
	</s:iterator> 
	
</table>
</body>
</html>