<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/' />

<script>
	alert('수정되었습니다.')
	location.href = '${root}board/my_qna?board_id=${param.board_id}'
</script>