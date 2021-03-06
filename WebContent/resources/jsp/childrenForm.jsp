<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<div id="submenu_ChildrenEmpInfoId_div">
		<div class="submenu_bg">
			<s:if test="#session.CHILDREN_ADD == true">
				<sj:a href="setUpChildren.action" targets="submenu_ChildrenEmpInfoId_div" indicator="indicatorSubMenuChildrenEmpInfoId_div" cssClass="link"><s:text name="MTIAddChildren" /></sj:a> |
			</s:if>
			<s:if test="#session.CHILDREN_VIEW == true">
				<sj:a href="getAllChildren.action" targets="submenu_ChildrenEmpInfoId_div" indicator="indicatorSubMenuChildrenEmpInfoId_div" cssClass="link"><s:text name="MTIViewChildren"/></sj:a> |
				<sj:a href="childrenSearchForm.action" targets="submenu_ChildrenEmpInfoId_div" indicator="indicatorSubMenuChildrenEmpInfoId_div" cssClass="link"><s:text name="MTISearchChildren"/></sj:a>
			</s:if>
		</div>
			<br/>
			<img id="indicatorSubMenuChildrenEmpInfoId_div" src="${pageContext.request.contextPath}/resources/images/indicator.gif" alt="Loading..." style="display:none"/>				    

	<s:if test="#session.USER_NAME==null"><%try{response.sendRedirect("doLogout.action");}catch(Exception e){e.printStackTrace();}%></s:if>
	
	<jsp:include page="common/messages.jsp" flush="true"/>
	    <s:form action="insertOrUpdateChildren">
	     <table class="maintable">
	         <tr>
	        	<td align="center" ><table class="formouter">
	         <tr>
	            <td><table class="employeeformiinertable">
	         <tr>
	                <td class="formtitle">
        		      <s:if test="child==null || child.empChildrenId == null">
						 <s:text name="label.title.children.add"/>
					   </s:if>
					   <s:else>
						 <s:text name="label.title.children.edit"/>
					   </s:else>
	                </td>
	         </tr>
	     	 <tr>
	               <td class="forminner"><table class="tablealign">    
		 	<s:if test="child==null || child.empChildrenId == null">
		 		<tr>
		        	<td class="inputtext"><s:text name="label.form.fields.common.empName"/></td>
		            <td class="employeeinputtd">
		            	<sj:autocompleter  
						    name="child.empIdObj.employeeId"
							list="#request.APPL_EMPLOYEE_LIST"
							listKey="employeeId"
							listValue="empFullName"
						    selectBox="true"
						    selectBoxIcon="true"
						    cssClass="employeeselect"
				    	/>
					</td>
					<td class="inputerrormessage"><s:fielderror fieldName="child.empIdObj.employeeId"/></td>
				</tr>
				<tr>
					<td></td>
					<td class="employeeinputtd"><s:text name="label.common.message.autocompleteSelect"></s:text></td>
				</tr>
	        </s:if>
	        <s:else>
	        	<tr>
	        		<td class="inputtext"><s:text name="label.header.common.empName"></s:text></td>
					<td class="employeedisplaytd"><s:textfield name="child.empIdObj.empFirstName" readonly="true" cssClass="employeeinput"/></td>
					<s:hidden name="child.empIdObj.employeeId" />
				</tr>
        	</s:else>
			<tr>
				<td class="inputtext"><s:text name="label.form.fields.children.name"/></td>
	         	<td class="employeeinputtd"><s:textfield name="child.childName" cssClass="employeeinput"/></td>
	         	<td class="inputerrormessage"><s:fielderror fieldName="child.childName"/></td>
	         </tr>
	         <!--Button image added by, R.Deepika-->
	         <tr>
	         	<td class="inputtext"><s:text name="label.form.fields.common.dob"/></td>
  	         	<td class="employeeinputtd"><sj:datepicker  name="child.childDOB" showButtonPanel="true" changeMonth="true" changeYear="true" displayFormat="mm/dd/yy" buttonImageOnly="true" cssClass="employeeinput" /></td>
      	     	<td class="inputerrormessage"><s:fielderror fieldName="child.childDOB"/></td>
	         </tr>
	         <tr>
				<td></td>
				<td class="employeeinputtd"><s:text name="label.date.format"></s:text></td>
			</tr>
	    </table></td></tr></table></td></tr></table></td></tr></table>
	    		 <br/>
	    <table align="center"> 
	    	     <tr>
	    		    <td>
						<img id="indicatorChiFormEmpInfoId_div" src="${pageContext.request.contextPath}/resources/images/indicator.gif" alt="Loading..." style="display:none"/>				    
	    		    	<sj:submit key="button.label.submit" cssClass="submitbutton117" targets="submenu_ChildrenEmpInfoId_div" indicator="indicatorChiFormEmpInfoId_div"/>
	    		    </td>
	    	        <td><s:if test="child==null || child.empChildrenId==null">
		    	        	<s:url var="resetChiForm" action="resetChiForm"></s:url>
		    	            <sj:submit href="%{resetChiForm}"  key="button.label.reset" cssClass="submitbutton117" targets="submenu_ChildrenEmpInfoId_div" indicator="indicatorChiFormEmpInfoId_div"/>
		    	        </s:if>
		    	        <s:else>
		    	        	<s:reset key="button.label.reset" cssClass="resetbutton117" />
		    	        </s:else></td>
	    		 </tr>
	    </table> 	
	    <s:hidden name="child.empChildrenId"/>		  		 
	    </s:form>
</div>