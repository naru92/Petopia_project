<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/' />

<script>
	alert('수정되었습니다.')
	location.href = '${root}notice/get?board_id=1&content_idx=${modifyContentVO.content_idx}'
</script>