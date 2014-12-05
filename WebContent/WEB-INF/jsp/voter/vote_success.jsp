<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<html:pageHead>
<style type="text/css">
#apDiv1 {
	position:absolute;
	left:190px;
	top:80px;
	width:750px;
	height:1140px;
	z-index:1;
	text-align: center;
}
#apDiv1 p {
	font-size: 36px;
}
.end01 {
	text-align: center;
	font-size: 24px;
}
</style>
<style type="text/css">
 .even{ background-color: #FFFFFF;}
 .odd {background-color: #F0F0F0;     }
</style>
<meta http-equiv="refresh" content="30;url=${root}/toupiao.do">
<script>
$(function () {
	$("tbody>tr:even").addClass("even");  
	$("tbody>tr:odd").addClass("odd"); 
});  
</script>
</html:pageHead>

<body>
<div class="end01">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><img src="images/200782117178994_2.jpg" alt="" width="152" height="141" />已成功完成投票，感谢您的参与！
		<a href="${root}/toupiao.do"> 返回继续投票 (30秒后自动跳转到投票页面)</a>&nbsp;&nbsp;
  </p>
  <p>&nbsp;</p>
</div>
<html:pagetitle title="本次投票结果" />
<br>
<table width="95%" class="table" align="center" cellpadding="1" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
       <td width="40" align="center" class="td_header">序号</td>
       <td class="td_header">候选人</td>
       <td class="td_header">同意</td>
       
       <td class="td_header">弃权</td>
       <td class="td_header">反对</td>
     </tr>
<s:iterator value="ticketlist" status="st">
	<tr>
		<td class="td_header"><s:property value="%{#st.index+1}" /></td> 
		<td class="td_body" align="center"><s:property value="candidate.name"/></td>
		<td class="td_body" align="center"><s:if test="agreement == \"1\"">√</s:if></td>
		<td class='td_body' align="center"><s:if test="abstention == \"1\"">√</s:if></td>
		<td class="td_body" align="center"><s:if test="against == \"1\"">√</s:if></td>
	</tr>			
</s:iterator>
</table>
</body>
</html>
