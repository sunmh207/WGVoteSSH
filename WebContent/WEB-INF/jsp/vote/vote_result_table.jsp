<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@ page import="com.stanley.vote.domain.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<html:pageHead >
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">

</html:pageHead>
<!-- <script type="text/javascript">
    $(function(){
    	//可以是:$('#t1 tbody tr:even').css('background','red');
    	$('#t2>tbody tr:even').css('background','red');
    	$('#t2>tbody tr:odd').css('background','blue');
    });
</script> -->
<body>
<s:actionerror/>
<html:pagetitle title="投票明细" />
<table id="t1" width="100%" class="table" cellpadding="0" cellspacing="0" align="center">
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
 <a class="return" href="#" onclick="history.back(-1);return false;">返回</a>
<% 
List<String> candidateList = (List<String>)request.getAttribute("candidateList");
List<String> ipList =(List<String>)request.getAttribute("ipList");
Map<String, Map<String, Ticket>> candidateMap=(Map<String, Map<String, Ticket>>)request.getAttribute("candidateMap");
//out.println("candidateMap="+candidateMap);
//out.println("candidateList="+candidateList);
//out.println("ipList="+ipList);
%>
 <table id="t2" width="100%"  align="center" cellpadding="1" cellspacing="0" bgcolor="#FFFFFF">
 <tbody>
	<tr>
		<td class="td_header" colspan="2"></td>
		<%for(String ip:ipList){ %>	
	    <td class="td_header"><%=ip%></td>
	    <%} %>
    </tr>

	<%
	int i=1;
	for(String candidate:candidateList){ 
	%>	
	<tr>
		<td align="left" class='td_header'><%=i++%></td>
		<td align="left" class='td_header'><%=candidate%></td>
		<%for(String ip:ipList){ %>	
	    <td class="td_body" align="center" width="100">
			<%
			 Map<String, Ticket> ipMap=candidateMap.get(candidate);
			 Ticket ticket=ipMap.get(ip);
			// out.println("ticket="+ticket);
			 if(ticket.getAgreement()==1){
				 out.print("√");
			 }
			 if(ticket.getAbstention()==1){
				 out.print("○");
			 }
			 if(ticket.getAgainst()==1){
				 out.print("×");
			 } 
			%>
		</td>
	    <%} %>
	</tr>
	<%} %>	
</tbody>	
</table> 
<br>
</body>
</html>