<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('470fd7a6155ae5841b6d4e52b40f8792'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

</script>
</head>

<body>

<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="/resources/assets/images/kakao_login_medium.png"
  />
</a>
<p id="token-result"></p>
<script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8882/calendar/kakao'
    })
  }


</script>


</body>
</html>