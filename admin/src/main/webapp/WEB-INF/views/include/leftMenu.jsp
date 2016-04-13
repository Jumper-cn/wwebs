<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="<%=request.getContextPath()%>/dist/img/admin.jpg" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p>admin</p>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<c:forEach var="menu" items="${sessionScope.leftMenuList}">
				<c:if test="${menu.parentId == 0}">
					<c:choose>
   						<c:when test="${menu.hasChild ==0}">
   							<c:set value="${pageContext.request.contextPath}${menu.url}${'?menuId='}${menu.id}" var="paramUrl"></c:set>
   							<c:choose>
   								<c:when test="${sessionScope.currentSelectMenuId == menu.id}">
   									<li class="active"><a href="${paramUrl}"><i class="fa fa-dashboard"></i> <span>${menu.name}</span></a></li>
   								</c:when>
   								<c:otherwise>
   									<li><a href="${paramUrl}"><i class="fa fa-dashboard"></i> <span>${menu.name}</span></a></li>
   								</c:otherwise>
   							</c:choose>
   						</c:when>
   						<c:otherwise>
   							<c:choose>
   								<c:when test="${sessionScope.currentSelectParentMenuId == menu.id}">
   									<li class="active treeview"><a href="#"> <i class="fa fa-home"></i> <span>${menu.name}</span> <i class="fa fa-angle-left pull-right"></i> </a>
   								</c:when>
   								<c:otherwise>
   									<li class="treeview"><a href="#"> <i class="fa fa-home"></i> <span>${menu.name}</span> <i class="fa fa-angle-left pull-right"></i> </a>
   								</c:otherwise>
   							</c:choose>
							<ul class="treeview-menu">
								<c:forEach var="subMenu" items="${sessionScope.leftMenuList}">
									<c:if test="${subMenu.parentId == menu.id}">
										<c:set value="${pageContext.request.contextPath}${subMenu.url}${'?menuId='}${subMenu.id}${'&menuParentId='}${subMenu.parentId}" var="subParamUrl"></c:set>
										<c:choose>
			   								<c:when test="${sessionScope.currentSelectMenuId == subMenu.id}">
			   									<li class="active"><a href="${subParamUrl}"><i class="fa fa-circle"></i> ${subMenu.name}</a></li>
			   								</c:when>
			   								<c:otherwise>
			   									<li><a href="${subParamUrl}"><i class="fa fa-circle"></i> ${subMenu.name}</a></li>
			   								</c:otherwise>
			   							</c:choose>
										
									</c:if>
								</c:forEach>
							</ul>
							</li>
   						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
	</section>
	<!-- /.sidebar -->
</aside>
