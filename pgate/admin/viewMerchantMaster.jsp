<%@ page language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="app.Config"%>
<% Config.setAllConfig(); %>
<jsp:include page="header.jsp" flush="true" />

<div id="body">
<table width="100%" cellspacing="2" cellpadding="0" border="0">
	<tbody>
	<tr>
		<td width="1%" valign="top" align="left"></td>
		<td width="19%" valign="top" align="left">

			<!--  left menu  -->	
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tbody><tr>
					<td valign="top" align="left">
					<!-- Left Side Start -->
						<jsp:include page="menu.jsp" flush="true"></jsp:include> 
					<!-- Left Side Ends --> 
					</td>
				</tr>
			</tbody></table>
			<!--  left menu  -->	

		</td>
		<td width="79%" valign="top" align="center">
 	<table cellspacing="0" cellpadding="5" border="0" style="table-layout: fixed;" class="sortable logincss" id="table">
 	<tr>
 		<td colspan="8" align="right">
 			<a href="<%=Config.get("SITE_PATH")%>/admin/MerchantMasterServlet">Add Merchant</a>
 		</td>
 	</tr>
	<tr class="menuMain" style="height: 38px;">
		<td> Merchant Id </td>
		<td> Merchant code </td>
        <td> Txn Limit </td>
		<td> Valid From</td>
		<td> Valid To</td>
		<td> Status </td>
		<td> PG Name </td>
		<td> Link </td>
	</tr>
<%
	if (request.getAttribute ("resultArray") != null) { 
		int shrows = 1;
		HashMap objField = null;
		ArrayList rows = new ArrayList (); 

		rows = (ArrayList)request.getAttribute ("resultArray");
		Iterator i = rows.iterator();
		objField = new HashMap ();
		
		while (i.hasNext()){
			objField.putAll((HashMap)i.next());
			
		
		String mmId = objField.get("merchant_id").toString();
		
		String showRows = null;
		if(shrows%2 == 0){
			showRows = "evenrow";
		}else{
			showRows = "oddrow";
		}
	%> 
		<form action="" method="post" id="frm" name="frm">
			<tr style="color: black;" class="<%= showRows  %>">
				<td> <%= objField.get("merchant_id")%> </td>
				<td> <%= objField.get("merchant_code")%> </td>
				<td> <%= objField.get("txn_limit")%> </td>
				<td> <%= objField.get("valid_from")%> </td>
				<td> <%= objField.get("valid_to")%> </td>
				<td>
					<% 
                        String viewActive = (String) objField.get("is_active"); 
                        if(viewActive.equalsIgnoreCase("no")){
                    %>
                    InActive
                    <%  }else{  %>
                    Active
                    <%  }  %>
                </td> 
                <td> <%= objField.get("pg_name")%> </td>
				<td> 
					<a href="<%=Config.get("SITE_PATH")%>/admin/MerchantMasterServlet?mmId=<%=mmId %>" >
                        <img src="<%=Config.get("SITE_PATH")%>/admin/images/icon_edit.gif" border="0" alt="Edit" />
                    </a>
				</td>
			</tr>
	</form>
	<%
	shrows++;	}
		}else{
	%>

	<tr>
		<td colspan="8"> No Records Found! </td>
	</tr>
<%
	}
%>
</table>
</table>
  	<br>
  	<!--<center>
	<a href="#" class="current">1</a> &nbsp;<span class="paginate">Page:&nbsp;</span><select onchange="window.location='/corporatetravel/index.php?page='+this[this.selectedIndex].value+'&amp;ipp=10&amp;link=list-tr';return false" class="paginate"><option selected="" value="1">1</option>
	</select>
	 <span class="paginate">Items per page:&nbsp;</span><select onchange="window.location='/corporatetravel/index.php?page=1&amp;ipp='+this[this.selectedIndex].value+'&amp;link=list-tr';return false" class="paginate"><option value="All">All</option>
	<option value="10" selected="selected">10</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	</select>
	</center>-->
	<br>
							
</td>
</tr>
</tbody></table>
<jsp:include page="footer.jsp" flush="true" />