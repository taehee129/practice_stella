<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, model.message.*, model.member.*"%>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO"/> 
<jsp:useBean id="messageVO" class="model.message.MessageVO"/> 
<jsp:useBean id="memberVO" class="model.member.MemberVO"/>
<jsp:useBean id="memberDAO" class="model.member.MemberDAO"/>
<jsp:setProperty property="*" name="messageVO"/>
<jsp:setProperty property="*" name="memberVO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String action = request.getParameter("action");
	
		if (action.equals("list")){
			ArrayList<MessageVO> datas = messageDAO.getDBList();
			request.setAttribute("datas", datas);
			pageContext.forward("list.jsp");
			
		}
		else if (action.equals("writing")){
			MessageVO data = messageDAO.getDBDate(messageVO);
			request.setAttribute("data", data);
			pageContext.forward("writing.jsp");
		}
		else if (action.equals("regis")){
			if(memberDAO.getDBDate(memberVO)==null){
				if(memberDAO.insertDB(memberVO)){
					out.println("<script>alert('회원가입이 완료했습니다!'); document.location.href='control.jsp?action=list';</script>");
					
				}
				else {
					System.out.println("회원가입 중 오류 발생");
				}
				
				
			}else {
				out.println("<script>alert('중복된 아이디 입니다! 다시 설정해 주세요!');history.go(-1)</script>");//테스트
				
			}
			
			
		}else if (action.equals("login")){
			if(memberDAO.getDBDate2(memberVO)!=null){
				
				session.setAttribute("member", memberVO);
				out.println("<script>alert('로그인이 완료했습니다. 게시판으로 이동합니다.');location.href='control.jsp?action=list'</script>");
			}else {
				out.println("<script>alert('로그인이 실패했습니다. 다시 입력해주세요');location.href='login.jsp'</script>");
			}
			
		}
		else if (action.equals("myList")){
			ArrayList<MessageVO> datas = messageDAO.getDBList();
			request.setAttribute("datas", datas);
			pageContext.forward("myList.jsp");
		}
		else if (action.equals("insert")){
			MemberVO member = (MemberVO)session.getAttribute("member");
			System.out.println("member.getMid():"+ member.getMid());
			String writer = member.getMid();
			messageVO.setWriter(writer);
			if(messageDAO.insertDB(messageVO)){
				out.println("<script>alert('글 등록이 완료되었습니다!'); location.href='control.jsp?action=list'</script>");
				
			}else {
				out.println("<script>alert('글 등록 중 오류가 발생했습니다!'); location.href='control.jsp?action=list'</script>");
			}
			
		}
		else if(action.equals("logout")){
			session.invalidate();
			out.println("<script>alert('로그아웃 완료했습니다!');location.href='index.html'</script>");
		}
	
	%>




</body>
</html>