﻿<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<html:pageHead >
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">

</html:pageHead>
<body>
<s:actionerror/>
<html:pagetitle title="投票结果" />
<table width="100%" class="table" cellpadding="0" cellspacing="0" align="center">
 	<tr>
        <td width="90" height="24" align="right" class="td_lable">投票名称</td>
        <td class="td_edit" colspan="3">		
        	<s:property value="vote.name"/>
        </td>
    </tr>
 	<tr>
        <td width="90" height="24" align="right" class="td_lable">投票时间</td>
        <td class="td_edit">		
			<s:property  value="vote.startDate" />
			<s:property  value="vote.startHour" />:
			<s:property  value="vote.startMinute"/> 
        </td>
        <td width="90" height="24" align="right" class="td_lable">类型</td>
        <td class="td_edit">		
			<s:property  value="vote.type" />
        </td>
    </tr>
    <tr>
        <td width="90" height="24" align="right" class="td_lable"> 要求 </td>
        <td class="td_edit" colspan="3">		
			<s:property value="vote.requirement"  />      
        </td>
    </tr> 
    <tr>
        <td width="90" height="24" align="right" class="td_lable"> 投票说明 </td>
        <td class="td_edit" colspan="3">		
			<s:property value="vote.note" />      
        </td>
    </tr> 
     <tr>
        <td width="90" height="24" align="right" class="td_lable">创建人</td>
        <td class="td_edit">		
			<s:property value="vote.creator"/>
        </td>
        <td width="90" height="24" align="right" class="td_lable">状态</td>
        <td class="td_edit">		
			<s:property value="vote.statusTXT"/>
        </td>
    </tr>  
</table>
<br>
<form id="searchForm" action="${root}/voter/my_candidate.do">
	<s:hidden name="vote.id"/>
		所在单位<input name="qryUnit" value='${qryUnit}' size="15">
		行政职务<input name="qryXingzhengPost" value='${qryXingzhengPost}' size="10">
		学历<input name="qryXueli" value='${qryXueli}' size="10">
	   <button class="user-search" type ="submit" >查询</button>

<a class="return" href="${root}/vote/my_vote.do"/>返回</a> 
<html:pagination exportExcel="true"/>
</form>


<table width="100%" class="table" align="center" cellpadding="1" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
       <td rowspan="2" align="center" class="td_header">序号</td>
       <td class="td_header" rowspan="2">姓名</td>
       <td class="td_header" rowspan="2">单位</td>
       <td class="td_header" rowspan="2">部门</td>
       <td class="td_header" rowspan="2">毕业学校</td>
       <td class="td_header" rowspan="2">所学专业</td>
       <td class="td_header" rowspan="2">参评学历</td>
       <td class="td_header" rowspan="2">专业工作年限</td>     
       <td class="td_header" rowspan="2">从事专业</td>     
       <td class="td_header" rowspan="2">备注</td>     
       <s:if  test="vote.primaryVote==null">
       <td class="td_header" colspan="4">投票表决</td>
       </s:if>
       <s:else>
       <td class="td_header" colspan="3">投票表决</td>
       </s:else>
       <!-- <td class="td_header" rowspan="2">操作</td> -->
     </tr>
	<tr>
       <td class="td_header">同意√	</td>
       <td class="td_header">弃权○</td>
       <td class="td_header">反对×</td>
     </tr>
	
	<s:iterator value="objectList" status="status">
		<tr>
			<td align="center" class="td_header"> ${status.index+pager.startRecord}</td>
			<td align="left" class='td_body'><s:property value="name"/></td>
			<td align="left" class='td_body'><s:property value="recommendUnit"/></td>
			<td align="left" class='td_body'><s:property value="dept"/></td>
			<td align="left" class='td_body'><s:property value="university"/></td>
			<td align="left" class='td_body'><s:property value="major"/></td>
			<td align="left" class='td_body'><s:property value="xueli"/></td>
			<td align="left" class='td_body'><s:property value="workYears"/></td>
			<td align="left" class='td_body'><s:property value="workMajor"/></td>
			<td align="left" class='td_body'><s:property value="note"/></td>
			<td align="left" class='td_body'><s:property value="latestCandidate.agreementNumber"/></td>
			<td align="left" class='td_body'><s:property value="latestCandidate.abstentionNumber"/></td>
			<td align="left" class='td_body'><s:property value="latestCandidate.againstNumber"/></td>
			<%-- <td align="center" class='td_body'>
			<s:if test="vote.status == \"2.ready\"">
				<a class="ui_icon_person" href="${root}/vote/ps_candidate.do?vote.id=<s:property value="id"/>" >投票详情</a>&nbsp;&nbsp;
			</s:if>
			</td> --%>
		</tr>
	</s:iterator>
</table>
</body>
</html>