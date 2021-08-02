<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	/* sidebar js */
	$(".ctgli:has(.ctgulChild)").click(function(e) {
		e.preventDefault();
		//li_HAVE_Child-hasShowed-hasSlideD
		if ($(this).hasClass('showed')) {
			//-x-hasSlideD
			$(this).children('.ctgulChild');
		} else {
			$('.ctgulChild');
			$('.ctgli').removeClass('showed');
			$(this).addClass('showed');
			$(this).children('.ctgulChild').slideToggle();
		}
	});
	$('.ctgli').click(function() {
		$(this).toggleClass('wtok');
	});
</script>