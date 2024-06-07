<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.affiliation.transaction.inspection_approval_panel.InspectionApprovalPanelModel"%>
<%@page import="com.sits.affiliation.transaction.inspection_approval_panel.InspectionApprovalPanelManager"%>
<%@include file="../myCks.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/create-inspection-approval-panel.js"></script>
<script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/examCommonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/commonDropDown.js"></script>
	
<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet" 	type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% 
String panel_id="", panel_code="", panel_name="", is_active="";
  panel_code = General.checknull(request.getParameter("X_PANELC")).trim();
  panel_name = General.checknull(request.getParameter("X_PANELN")).trim();
%>
 <form name="frmInspectionL" id="frmInspectionL" action="" method="post" autocomplete="off">
	<div id="searchingTable1" class=" scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage1"  id="errMsg1"></div>
			 </div>
		   </div>
	   <div class="page-header-1">
		    <div class="col-sm-4 repTitle ">List of Created Panel(s)</div>
		    <div class="col-sm-4 repTitle text-center">Run Date : <%=General.currdate_time() %> &nbsp;</div>	
	   </div>	
	<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
			<thead class="theadnew" >
				<tr>
					<th class="text-center">S.No.</th>
					<th class="text-center">Panel Code</th>
					<th class="text-center">Panel Name</th>
					<th class="text-center">Is Active</th>
					<th class="text-center">View</th>
					<th class="text-center">Delete</th>
				</tr>
			</thead>	
			<tbody>
			
			          <%
			
			                     
										int i=0;
										ArrayList<InspectionApprovalPanelModel> list = null;
										InspectionApprovalPanelModel qt  = new InspectionApprovalPanelModel();
										qt.setPanel_id(panel_id);
										qt.setPanel_code(panel_code);
										qt.setPanel_name(panel_name);
										qt.setIs_active(is_active);
										try {
											list = InspectionApprovalPanelManager.searchRecord(qt);
											if(list.size()>0) {
												Iterator itr = list.iterator();
												while(itr.hasNext()) {
													i++;
													InspectionApprovalPanelModel imodel = (InspectionApprovalPanelModel)itr.next();
													panel_id   		                    = General.checknull(imodel.getPanel_id()).trim();
													panel_code   	                     = General.checknull(imodel.getPanel_code()).trim();
													panel_name	                         = General.checknull(imodel.getPanel_name()).trim();
													if(	General.checknull(imodel.getIs_active()).trim().equals("Y")){
														is_active    = "Yes";
													}else{
														is_active    = "No";
													}
			%> 
			
				 <tr>
				      <td style="text-align:center;width:5%;"><%=i%></td> 
				    <%--  <td style="text-align:center;width:15%;"><%=panel_id%></td> --%>
					 <td style="text-align:center;width:12%;"><%=panel_code%></td>
					 	 <td style="text-align:center;width:12%;"><%=panel_name%></td>
					 <td style="text-align:center;width:12%;"><%=is_active%></td>
				 <td style="text-align:center;color:blue;cursor: pointer; width:6%" ><span id="" onClick="editRow('<%=panel_id%>','E')"><i class="fa fa-edit"></i>Edit</span></td>
		             <td class="colr-red-p text-center" style="width:6%;color:red;"><span id="" onClick="editRow('<%=panel_id%>','D')"><i class="fa fa-trash p-l-3"></i>Delete</span></td>  
<%-- 					 <td class="colr-blue-p text-center" style="width:7%; color:blue;"><span id="EDIT_RECORD_<%= i%>" onClick="editRow('<%=panel_id%>','E')"><i class="fa fa-edit p-l-3"></i>Edit</span></td>
				    <td class="colr-red-p text-center" style="width:7%;color:red;"><span id="DELETE_RECORD_<%= i%>" onClick="editRow('<%=panel_id%>','D')"><i class="fa fa-trash p-l-3"></i>Delete</span></td> --%> 
				 </tr> 
				 				 <%				}
												
							}
											
						}catch(Exception e){System.out.println("Error in create_inspection_approval_panel_l.jsp"+e.getMessage());	
					} finally {
					list.clear();
				}
			%>
				 
		 
		
			</tbody>
	</table>
	</div>
	<input type="hidden" name="id" id="id" style="width:0px;" readOnly/>

			<input type="hidden" name="panel_id" id="panel_id" />
			<input type="hidden" name="opt_typ" id="opt_typ" style="width:0px;" readOnly/>
 </form>
		<script src="../resources/sits/DataTable/1.10.15/js/jquery.js"></script>
		<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
		<script src="../resources/sits/DataTable/1.10.15/js/jquery.dataTables.js"></script>
		<script src="../resources/sits/DataTable/1.10.15/js/dataTables.bootstrap.js"></script>
		<script src="../resources/sits/DataTable/1.4.2/js/buttons.flash.min.js"></script>
		<script src="../resources/sits/DataTable/1.4.2/js/buttons.html5.min.js"></script>
		<script src="../resources/sits/DataTable/1.4.2/js/buttons.print.min.js"></script>
		<script src="../resources/sits/DataTable/1.4.2/js/dataTables.buttons.min.js"></script>
		<script src="../resources/sits/DataTable/1.4.2/js/vfs_fonts.js"></script> 
		<script src="../resources/sits/DataTable/1.4.2/js/jszip.min.js"></script>
		<script>    
		
		       var t = $('#searchTable').DataTable({
		  		"searching" : false,
		  		"lengthMenu": [[-1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		  		//"scrollY": "200px",
		         "scrollX": true,
		         "scrollCollapse": true,
		         "paging":true,
		        
		  		"columnDefs": [{
		         	"searchable": false,
		         	"orderable": false,
		         	"targets": 0
		     	}],
		        "order": [[ 1, 'asc' ]],
		
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
		        	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
		   		  "<'row'<'col-sm-12'tr>>" +
				    	  "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
				buttons: [
				{	
				extend: 'excelHtml5',
				title: 'Create Inspection and Approval Panel',
				filename: 'Create Inspection and Approval Panel',
				className: 'btn btn-view',
				text	:'Download',
				exportOptions: {
				columns: [ 0,1,2,3]
				},
				},
				],                      	       	
				columnDefs: [
		     		{ orderable: false, "targets":[0,4,5]}     		
					],
					 }); 
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
	    </script>   
	  
	  <form name="actionForm" id="actionForm" method="post" action="" target="_parent"> 
	<input type="hidden" id="id" name="id" value="" >
	<input type="hidden" id="fstatus" name="fstatus"  />
	</form>
</body>
</html>