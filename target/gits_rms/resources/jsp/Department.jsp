<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<%@page import="com.gits.rms.vo.DepartmentVO"%>

<div id="submenu_department_list_div_id">
<div class="submenu_bg">
	<s:if test="#session.DEPARTMENT_ADD == true">
		<sj:a href="setUpDepartment.action" targets="submenu_department_list_div_id" indicator="indicatorSubMenuDepartment" cssClass="link"><s:text name="MTIAddDepartment"/></sj:a> |
	</s:if>
	<s:if test="#session.DEPARTMENT_VIEW == true">
		<sj:a href="getAllDepartment.action" targets="submenu_department_list_div_id" indicator="indicatorSubMenuDepartment" cssClass="link"><s:text name="MTIViewDepartment"/></sj:a> |
		<sj:a href="deptSearchForm.action" targets="submenu_department_list_div_id" indicator="indicatorSubMenuDepartment" cssClass="link"><s:text name="MTISearchDepartment"/></sj:a>
	</s:if>
</div>
<br/>
<img id="indicatorSubMenuDepartment" src="${pageContext.request.contextPath}/resources/images/indicator.gif" alt="Loading..." style="display:none"/>				    

	<s:if test="#session.USER_NAME==null"><%try{response.sendRedirect("doLogout.action");}catch(Exception e){e.printStackTrace();}%></s:if>
	<jsp:include page="common/messages.jsp" flush="true"/>
	<div class="informationMessageSingle"><li><span><s:text name="label.title.department.list"/></span></li></div>
	<s:set name="NO_OF_RECORDS" value="#session.NO_OF_RECORDS"></s:set>
	  <s:text name="label.header.department.name" var="HDepartmentName"></s:text>
	  <s:text name="label.common.link.view" var="HView"></s:text>
	  <s:text name="label.common.link.edit" var="HEdit"></s:text>
	  <s:text name="label.common.link.delete" var="HDelete"></s:text>
	  		   
	  <div id="display_tag_departmentList_div_id">
		  <display:table class="tableborder" id="departmentListId" name="deptList" pagesize="${NO_OF_RECORDS}" requestURI="getAllDepartment.action" sort="list" defaultsort="1" defaultorder="ascending" export="true">
		    <%
		    	try{
		    		String sDepartmentId = ((DepartmentVO)pageContext.getAttribute("departmentListId")).getHcmoDepartmentId().toString();
		        	request.setAttribute("DepartmentId", sDepartmentId);	
		    	}catch(NullPointerException ne){
		        }    	
		    %>
		    <display:column property="deptName" title="${HDepartmentName}" sortable="true" headerClass="sortable"/>
		    	<s:if test="#session.DEPARTMENT_VIEW==true">
					<display:column title="${HView}" class="viewedit" media="html">
						<s:url var="listViewDepartment" action="departmentView">
							<s:param name="dept.hcmoDepartmentId" value="#request.DepartmentId"></s:param>
						</s:url>
						<s:a href="#" onclick="doPostCall('submenu_department_list_div_id','%{listViewDepartment}','');"><s:text name="View"/></s:a>
					</display:column>
				</s:if>
				<s:if test="#session.DEPARTMENT_UPDATE==true">
					<display:column title="${HEdit}" class="viewedit" media="html">
						<s:url var="listSetUpDepartment" action="setUpDepartment">
							<s:param name="dept.hcmoDepartmentId" value="#request.DepartmentId"></s:param>
						</s:url>
						<s:a href="#" onclick="doPostCall('submenu_department_list_div_id','%{listSetUpDepartment}','');"><s:text name="Edit"/></s:a>
					</display:column>
				</s:if>
				<s:if test="#session.DEPARTMENT_DELETE==true">
					<display:column title="${HDelete}" class="viewedit" media="html">
						<s:url var="listDeleteDepartment" action="deleteDepartment">
							<s:param name="dept.hcmoDepartmentId" value="#request.DepartmentId"></s:param>
						</s:url>
						<s:a href="#" onclick="doPostCall('submenu_department_list_div_id','%{listDeleteDepartment}','');"><s:text name="Delete"/></s:a>
					</display:column>
				</s:if>
				<display:setProperty name="export.csv.filename" value="Department.csv"/>
			    <display:setProperty name="export.excel.filename" value="Department.xls"/>
			    <display:setProperty name="export.xml.filename" value="Department.xml"/>
		  </display:table> 
	  </div>
	     
	  <s:if test="#session.CONFIGURATION == 'CONFIGURATION'">
		  <table align="center">
				<tr>
					<td>
						<s:url var="nextConfigurationAction" action="nextConfigurationAction"/>
						<sj:submit href="%{nextConfigurationAction}" value="Next" targets="submenu_department_list_div_id" cssClass="submitbutton117"/>
					</td>
					<td>
						<div class="button-comments">
	   		    		<div class="button-left"></div>
	   		    			<s:url var="skippedPermanently" action="skippedPermanently"/>
							<sj:submit href="%{skippedPermanently}" value="Skipped Permanently" targets="submenu_department_list_div_id" cssClass="button-midle"/>
						<div class="button-right"></div>
	   		    		</div>
					</td>
					<td>
						<s:url var="skip" action="skip"/>
						<sj:submit href="%{skip}" value="Skip" targets="submenu_department_list_div_id" cssClass="submitbutton117"/>
					</td>
				</tr>
		</table>
	</s:if> 
</div>
<script type="text/javascript">
	//To submit the Sorting and Pagination of DisplayTag in a Div
   	jQuery(document).ready(function() {
   		try{
   		 	jQuery("#display_tag_departmentList_div_id").displayTagAjax();
   		}catch(e){
   		}
  	});
</script> 