<!-- @author Ashwani kumar  (13-May-2024) added by amit dangi replicate from portal  -->  
<%@include file="../myCks.jsp"%> 
<%@page import="com.sits.general.ReadProps"%>
    <%@page import="com.sits.affiliation.approval.inspector_inspection_detail.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.general.General"%>  
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<title></title>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"  type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />
</head>
<%
String id="", mid="",obj="",Inst_Id="";
Inst_Id=General.checknull(request.getParameter("Inst_Id"));
id= General.checknull(request.getParameter("id"));
mid= General.checknull(request.getParameter("mid"));
obj= General.checknull(request.getParameter("obj"));
JSONObject SubOptionList = new JSONObject(); 
SubOptionList=InspectorInspectionManager.getSubOptions(Inst_Id,id,mid);
%>
<body>
	<%if(obj.equals("inst_name")){ %>
		<div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label class="col-sm-2 p-0 col-form-label " for="">Old Institute Name</label>
					<div class="col-sm-10" style="font-size: medium; font-weight: 800;">&nbsp;&nbsp;&nbsp;&nbsp; <%=SubOptionList.get("old_inst_name")%></div>
				</div>
			</div>
		</div>
		 <div class="form-group">
			<div class="col-md-12">
				<div class="row">
					<label class="col-sm-2 p-0 col-form-label " for="">New Institute Name</label>
					<div class="col-sm-10" style="font-size: medium; font-weight: 800;">&nbsp;&nbsp;&nbsp;&nbsp; <%=SubOptionList.get("new_inst_name")%></div>
				</div>
			</div>
		</div>
	<%}else if(obj.equals("merge_inst_name")){ %>
	 <div class="form-group">
		<div class="col-md-12 table-responsive" style="padding: 0px;border: 1px solid #fff;">
			<div id="" class="dataEntryDiv" style="padding: 0px;">
				<table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
					<thead>
						<tr>
							 <th class="text-center">S.No.</th>
							 <th class="text-center">Propose Institutions Name</th>
						</tr>
					</thead>
					<tbody>
					<% int j=0;
					ArrayList<InspectorInspectionModel> MergeinstList=null;
					MergeinstList=InspectorInspectionManager.getMergeinstName(Inst_Id, id, mid,obj);
					for(InspectorInspectionModel mrg: MergeinstList){ %>
						<tr>
							<td style="text-align: center; width: 3%;"><%=++j %></td>
							<td style="text-align: left; width: 15%;">
							   <label for="" class="col-form-label "><%=General.checknull(mrg.getPROP_INST_NAME())%></label>
							</td>
						</tr> 
						<%}%>	   
					</tbody>
				</table>
			</div>
		</div>
	  </div>
  <%}else if(obj.equals("change_course_name")){ %>
	 <div class="form-group">
		<div class="col-md-12 table-responsive" style="padding: 0px;border: 1px solid #fff;">
			<div id="" class="dataEntryDiv" style="padding: 0px;">
				<table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
					<thead>
						<tr>
							 <th class="text-center">S.No.</th>
							 <th class="text-center">Course Name</th>
							  <th class="text-center">Old Branch Name</th>
							 <th class="text-center">New Branch Name</th>
						</tr>
					</thead>
					<tbody>
					<% int k=0;
					ArrayList<InspectorInspectionModel> ChangeCouseNameList=null;
					ChangeCouseNameList=InspectorInspectionManager.getMergeinstName(Inst_Id, id, mid,obj);
					for(InspectorInspectionModel crlist: ChangeCouseNameList){ %>
						<tr>
							<td style="text-align: center; width: 3%;"><%=++k %></td>
							<td style="text-align: left; width: 15%;">
							   <label for="" class="col-form-label "><%=General.checknull(crlist.getOld_course_name())%></label>
							</td>
							<td style="text-align: left; width: 15%;">
							   <label for="" class="col-form-label "><%=General.checknull(crlist.getOld_degree())%></label>
							</td>
							<td style="text-align: left; width: 15%;">
							   <label for="" class="col-form-label "><%=General.checknull(crlist.getNew_course_name())%></label>
							</td>
						</tr> 
						<%}%>	   
					</tbody>
				</table>
			</div>
		</div>
	  </div>
 <%}else if(obj.equals("apprv_after_break")){ %>
	<div class="col-md-12">
		<div class="row">
					<label class="col-sm-4 col-xs-3 col-form-label text-right" for="">From Gap Year</label>
					<div class="col-sm-2 col-xs-3"> <%=SubOptionList.get("gap_fyear")+" ~ "+((Integer.parseInt(SubOptionList.get("gap_fyear").toString()))+1)%></div> 
					
					<label class="col-sm-4 col-xs-3 col-form-label text-right" for="">To Gap Year</label>
					<div class="col-sm-2 col-xs-3"> <%=SubOptionList.get("gap_tyear")+" ~ "+((Integer.parseInt(SubOptionList.get("gap_tyear").toString()))+1)%></div>
			</div>
		</div>
<%}else if(obj.equals("Is_course")){ %>
	<div class="form-group">
		<div class="col-md-12 table-responsive" style="padding: 0px;border: 1px solid #fff;">
			<div id="" class="dataEntryDiv" style="padding: 0px;">
				<table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
					<thead>
						<tr>
							 <th class="text-center">S.No.</th>
							 <th class="text-center">Branch/Specialization</th>
						</tr>
					</thead>
					<tbody>
					<% int i=0;
					ArrayList<InspectorInspectionModel> arrayListDetail=null;
					arrayListDetail=InspectorInspectionManager.getProgramNameByCourseName(Inst_Id, id, mid);
					for(InspectorInspectionModel itm: arrayListDetail){
					%>
						<tr>
							<td style="text-align: center; width: 3%;"><%=++i %></td>
							<td style="text-align: left; width: 15%;">
							   <label for="" class="col-form-label "><%=General.checknull(itm.getDegree())%></label>
							</td>
						</tr> 
						<%}%>	   
				</tbody>
			</table>
		</div>
	</div>
  </div> <!-- End Form-group -->
  <%}else{%>
	<div class="form-group">
		<div class="col-md-12">
			<div class="row">
				<label class="col-sm-2  col-form-label " for="">No Data Found</label>
			</div>
		</div>
	</div>
  <%} %>
</body>
</html>