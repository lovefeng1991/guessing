<%@page import="cn.edu.zjgsu.guess.GuessBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>猜数字</title>
<script type="text/javascript">
	/* 添加事件函数 */
	function addEvent(element, eventType, handler) {
		if (element.addEventListener) {	//火狐，谷歌浏览器
			element.addEventListener(eventType, handler, false);
		} else if (element.attachEvent) {	//IE浏览器
			element.attachEvent('on' +eventType, handler);
		} else {	//IE浏览器
		element['on' +eventType] = handler;
		}
	} 
	
	function check() {
		/* 获取文本框元素 */
		var numberText = document.getElementById('number');
		/* 获取文本框值 */
		var sNumber = numberText.value;
		/* 显示信息元素 */
		var msgP = document.getElementById('showMsg');
		/* 标志位 如果输入的值是1-100之间的正整数 值为false，反之则为true */
		var bError = false;
		if (sNumber != null && sNumber != '') {
			if (isNaN(sNumber)) {
				/* 输入字母 */
				msgP.innerHTML = '输入值包含字母或者空格，请重新输入！';
				bError = true;
			} else {
				if (sNumber != parseInt(sNumber)) {
					/* 输入浮点 */
					msgP.innerHTML = '输入值为小数或者包含空格，请重新输入！';
					bError = true;
				} else {
					sNumber = parseInt(sNumber);
					if (sNumber < 1 || sNumber > 100) {
						/* 输入了超过1-100之间的数 */
						msgP.innerHTML = '输入值不是1-100之间的正整数，请重新输入！';
						bError = true;
					}
				}
			}
		} else {
			/* 输入框为空 */
			msgP.innerHTML = '未输入任何值，请输入正整数！';
			bError = true;
		}
		if (bError) {
			numberText.value = '';
			return false;
		} else {
			return true;
		}
	}
	</script>
	<style type="text/css">
		span {
			color: red;
		}
		#content {
			border: 1px solid gray; 
			margin-bottom: 5px; 
			padding-bottom: 10px;
			width: 750px;
			height: 80px;
		}
		#msg {
			font-size: 24px;
		}
		p#showMsg {
			color: red;
		}
	</style>
</head>
<body>
	<center>
		<div id="content">
			<form action="guess" method="post" name="guessNumber" onsubmit="return check();">
				<p><b>程序随机产生1-100的正整数，输入正整数点击“猜谜”开始，程序会统计猜谜次数和所用时间</b></p>
				<label>请输入正整数：</label>
				<input type="text" name="number" id="number" />
				<input type="submit" value="猜数字" />
			</form>
		</div>
		<div id="msg">
			<% 
				GuessBean gBean = (GuessBean)session.getAttribute("guess");
				if (gBean == null) {
					GuessBean guessBean = new GuessBean();
					session.setAttribute("guess", guessBean);
				} else {
					if (gBean.getIsRight()) {
			%>
			<p>恭喜你答对了，正确的数字为：<span><%= gBean.getResult() %></span></p>
			<% session.setAttribute("guess", new GuessBean()); } else { %>
			<p>数字范围为：<span><%= gBean.getMinNum() %></span> - <span><%= gBean.getMaxNum() %></span></p>
			<% } %>
			<p>总共猜了：<span><%= gBean.getN() %></span>次</p>
			<p>花费的时间为：<span><%= gBean.getTime() %></span>秒</p>
			<p style="display: none;"><%= gBean.getResult() %></p>
			<% } %>		
			<p id="showMsg"></p>
		</div>
	</center>
</body>
</html>