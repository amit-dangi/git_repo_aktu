<%@page import="com.sits.affiliation.common_master.questionnaire_master.QuestionnaireMastManager"%>
<%@page import="com.sits.affiliation.common_master.questionnaire_master.QuestionnaireMastModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../myCks.jsp"%>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />
	<title><%=ReadProps.getkeyValue("welcome.header", "sitsResource") %></title>
	
	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css"  type="text/css">
	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 

	<script type="text/javascript" src="../resources/js/common/common.js"></script>	
	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
	<script type="text/javascript" src="../resources/js/common/gen.js"></script>
	<script type="text/javascript" src="../js/examCommonDropDown.js"></script>

	<script type="text/javascript" src="../resources/js/affiliation/questionnaire-master.js"></script>
	<%
		response.setHeader("Cache-Control","no-store"); //HTTP 1.1
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setDateHeader ("Expires", -1); //prevents caching at the proxy
	%>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />	
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <%
	 String ques_name	= General.checknull(request.getParameter("ASQUES_NAME"));
	 String	ques_type	= General.checknull(request.getParameter("ASQUES_TYPE"));
 %>
<form name="frmQuestnrMastl" id="frmQuestnrMastl" action="" method="post" autocomplete="off">
	<div id="searchingTable1" class="scr0">
		<!-- <div class="col-sm-12">
			<div class="row">
				<div class="errmessage text-center" id="errMsg"></div>
			</div>
		</div> -->
		 <div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage2" id="errMsg"></div>
					</div>
				</div> 
					<div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage1" id="errMsg1"></div>
					</div>
				</div>
		<div class="page-header-1">
			<div class="col-sm-4 repTitle h5 ">List of Questionnaire (s)</div>
				<div class="col-sm-4 repTitle h6 text-center">Run Date :<%=General.currdate_time() %></div>
		</div>
    	<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" style="">
			<thead>
				<tr>
					<th class="text-center">S.No.</th>
					<th class="text-center">Questionnaire Name</th>
					<th class="text-center">Questionnaire Type</th>
					<th class="text-center">Questionnaire Sub Type</th>
					<th class="text-center">Edit</th>
					<th class="text-center">Delete</th>
				</tr>
			</thead>	
			<tbody>
<%
	int i=0;	
	QuestionnaireMastModel model=new QuestionnaireMastModel();
	ArrayList<QuestionnaireMastModel> list =null;
	System.out.println();
	model.setQues_name(ques_name);
	model.setQues_type(ques_type);
	try {
		list=QuestionnaireMastManager.search(model);
		if(list.size()>0){
     		Iterator<QuestionnaireMastModel> itr=list.iterator();
     	while(itr.hasNext()){
        	i++;
        	QuestionnaireMastModel data = (QuestionnaireMastModel)itr.next();
%>
                <tr>
					<td style="text-align:center; width:5%;"><%=i %></td>
					<td style="text-align:center; width:25%;"><%=General.checknull(data.getQues_name()) %></td>
					<td style="text-align:center; width:20%;"><%=General.checknull(data.getQues_type())%></td>
					<td style="text-align:center; width:20%;"><%=General.checknull(data.getQues_sub_type())%></td>
					<td class="colr-blue-p" style="width:15%;"><span id="" onClick="editRecord('<%=General.checknull(data.getQues_id()) %>')"><i class="fa fa-edit"></i>Edit</span></td>
	   				<td class="colr-red-p" style="width:15%;"><span id="" onClick="delRecord('<%=General.checknull(data.getQues_id()) %>')"><i class="fa fa-trash"></i>Delete</span></td>
				 </tr>
<%
      			}
			}
		}catch(Exception e){System.out.println("Error in questionnaire_master_l.jsp"+e.getMessage());	
			} finally {
			list.clear();
		}
%>	 
				 
			</tbody>
		</table>
	</div>
</form>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../resources/sits/DataTable/1.10.15/js/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/sits/DataTable/1.10.15/js/jquery.dataTables.js"></script>
<script src="../resources/sits/DataTable/1.10.15/js/dataTables.bootstrap.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/buttons.flash.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/buttons.html5.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/buttons.print.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/dataTables.buttons.min.js"></script>
<script src="../resources/sits/DataTable/1.4.2/js/vfs_fonts.js"></script> 
<script src="../resources/sits/DataTable/1.4.2/js/jszip.min.js"></script>
<script>
      $(document).ready(function() {
    	    var t = $('#searchTable').DataTable( {
    	    	"searching" : false,
				//"scrollY": "500px",
				"ordering": false,
				"scrollX": true,
				"scrollCollapse": true,
				"paging": true,
				//"lengthMenu": [[10, 25, 50,100,200,500, -1], [10, 25, 50,100,200,500, "All"]],
				"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
				"columnDefs": [ {
				"searchable": false,
				"orderable": false,
				"targets": 0
				} ],
    	         dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
            	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
       		    "<'row'<'col-sm-12'tr>>" +
        	    "<'row'<'col-sm-5'i><'col-sm-7'p>>",   
	        	buttons: [
	            	{	
   	                	extend: 'excelHtml5',
   	                	filename: 'Questionnaire_Master_<%=General.currdate_time().replaceAll(":", ".") %>',
   	                	className: 'btn btn-view',
   	                	text	:'Download',
   	                	exportOptions: {
   	                    	columns: [ 0,1,2,3]
   	                	},
   	           		 }
	        	],
    	        columnDefs: [{ orderable: false, "targets": [0,4,5] },
   				  
   				 ],
    	        "order": [[ 1, 'asc' ]]
    	    } );
    	 
    	    t.on( 'order.dt search.dt', function () {
    	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
    	            cell.innerHTML = i+1;
    	        } );
    	    } ).draw();
    	} );
      
</script>
</body>
</html>