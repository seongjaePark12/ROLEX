<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="../include/bs4.jsp" %>
	<title>회원가입페이지</title>
	<%@ include file="../js/JoinJs.jsp" %>
	<%@ include file="../css/JoinCss.jsp" %>
	<script>
		function midCheck(){
			location.href="<%=request.getContextPath()%>/IdCheck1";			
		}
	</script>
</head>
<body>
	<div class="container bg-white" style="width: 90%">
    <div class="bg-white" style=" text-align: center;">
      <form name="myform"  style="display: inline-block; border: none;" method="post" action="<%= request.getContextPath()%>/JoinP"  class="was-validated bg-white" >
          <br><br>
          <h1 class="font-weight-bold" ><a href="join.html" id="jojo">REGISTRATION</a></h1><br/>
          <div>
            <div>
              <label ><b>아이디</b><font size="2px" color="#AF4034"> *</font></label><br/>
            </div>
            <div>
              <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력해주세요" minlength="6" maxlength="20" autofocus required>
              <div class="valid-feedback"></div>
              <div class="invalid-feedback"  style="text-align: left;">아이디는 영문 또는 숫자를 포함하여 6 ~ 20자로 작성해주세요</div>
            </div>
            <div class="text-left" style="padding-top: 3px; padding-right: 3px;">
              <input type="button" class="btn btn1 btn-sm" name="btnIdCheck" value="중복체크" onclick="midCheck()" />
            </div>
          </div>
          <br/>
          <div>
            <div>
              <label for="pwd"><b>비밀번호</b><font size="2px" color="#AF4034"> *</font></label><br/>
            </div>
            <div>
              <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" minlength="8" maxlength="20" required>
              <div class="valid-feedback"></div>
              <div class="invalid-feedback" style="text-align: left;">비밀번호는 영문, 숫자, 특수문자를 포함하여 8 ~ 20자로 작성해주세요</div>
            </div>
            <br/>
            <div>
          </div>    
          <div>
            <div style="padding-top: 6px;">
              <label for="pwdTest"><b>비밀번호 확인</b><font size="2px" color="#AF4034"> *</font></label>
            </div> 
            <div>
              <input type="password" class="form-control" name="pwdTest" id="pwdTest" placeholder="비밀번호를 확인해주세요" minlength="8" maxlength="20" required>
              <div class="valid-feedback"></div>
              <div class="invalid-feedback" style="text-align: left;">입력하신 비밀번호와 일치하게 입력해주세요</div>
            </div>
          </div>    
          <br/>
          <div>
            <div>
              <label for="name"><b>이름</b><font size="2px" color="#AF4034"> *</font></label>
            </div>   
            <div>
              <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요" minlength="1" maxlength="20" required>
            </div>
          </div> 
          <br/>
          <div>
            <div>
              <label for="birth"><b>생년월일</b><font size="2px" color="#AF4034"></font></label><br/>
            </div>
            <div>
              <select name="birth" id="birth" style="height: 47px; width: 144px;" required>
                  <option value="년">년</option>
                  <option value="1980">1980</option>
                  <option value="1981">1981</option>
                  <option value="1982">1982</option>
                  <option value="1983">1983</option>
                  <option value="1984">1984</option>
                  <option value="1985">1985</option>
                  <option value="1986">1986</option>
                  <option value="1987">1987</option>
                  <option value="1988">1988</option>
                  <option value="1989">1989</option>
                  <option value="1990">1990</option>
                  <option value="1991">1991</option>
                  <option value="1992">1992</option>
                  <option value="1993">1993</option>
                  <option value="1994">1994</option>
                  <option value="1995">1995</option>
                  <option value="1996">1996</option>
                  <option value="1997">1997</option>
                  <option value="1998">1998</option>
                  <option value="1999">1999</option>
                  <option value="2000">2000</option>
                  <option value="2001">2001</option>
                  <option value="2002">2002</option>
                  <option value="2003">2003</option>
                  <option value="2004">2004</option>
                  <option value="2005">2005</option>
                  <option value="2006">2006</option>
                  <option value="2007">2007</option>
                  <option value="2008">2008</option>
                  <option value="2009">2009</option>
                  <option value="2010">2010</option>
                  <option value="2011">2011</option>
                  <option value="2012">2012</option>
                  <option value="2013">2013</option>
                  <option value="2014">2014</option>
                  <option value="2015">2015</option>
                  <option value="2016">2016</option>
                  <option value="2017">2017</option>
                  <option value="2018">2018</option>
                  <option value="2019">2019</option>
                  <option value="2020">2020</option>
                  <option value="2021">2021</option>
              </select>
              <select name="mm" style="height: 47px; width: 142px;" required>
                  <option value="월">월</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option> 
              </select>
              <select name="dd" style="height: 47px; width: 142px;" required>
                  <option value="일">일</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option> 
                  <option value="13">13</option> 
                  <option value="14">14</option> 
                  <option value="15">15</option> 
                  <option value="16">16</option> 
                  <option value="17">17</option> 
                  <option value="18">18</option> 
                  <option value="19">19</option> 
                  <option value="20">20</option> 
                  <option value="21">21</option> 
                  <option value="22">22</option> 
                  <option value="23">23</option> 
                  <option value="24">24</option> 
                  <option value="25">25</option> 
                  <option value="26">26</option> 
                  <option value="27">27</option> 
                  <option value="28">28</option> 
                  <option value="29">29</option> 
                  <option value="30">30</option> 
                  <option value="31">31</option> 
              </select>
              <br><br>
            </div>
          </div>
          <div>
            <div>
              <label for="gender"><b>성별</b><font size="2px" color="#AF4034"></font></label><br/>
            </div>
            <div>
              <select name="gender" id="gender" style="height: 48px; width: 443px; margin-top: 10px;">
                  <option value="">성별</option>
                  <option value="여자">여자</option>
                  <option value="남자">남자</option>
              </select>
            </div>
          </div>  
          <br>
          <div>
            <div>
              <label for="email"><b>이메일</b><font size="2px" color="#AF4034"> *</font></label><br/>
            </div>
            <div>
              <input type="text" name="email" id="email" required placeholder="이메일을 입력하세요">
              @
              <select name="email2" id="email2" style="height: 47px; width: 160px;">
                  <option value="">메일주소를 선택하세요</option>
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="nate.com">nate.com</option>
                  <option value="yahoo.co.kr">yahoo.co.kr</option>
                  <option value="nate.com">nate.com</option>
              </select>
              <div class="valid-feedback"></div>
              <div class="invalid-feedback" style="text-align: left;">이메일은 비밀번호 찾기에 사용됩니다</div>
            </div>
          </div>
          <br>
          <div>
            <div>
              <label for="phone"><b>휴대 전화</b><font size="2px" color="#AF4034"> *</font></label><br/>
            </div>
            <div>
              <input type="text" name="getCode" id="getCode" required  minlength="2" maxlength="3" required>
              -
              <input type="text" name="getCode2" id="getCode2" required  minlength="2" maxlength="4" required>
              -
              <input type="text" name="getCode3" id="getCode3" required  minlength="3" maxlength="4" required>
            </div>
          </div>
          <br>
          <!-- <div>
            <div>
              <label for="address"><b>주소</b><font size="2px" color="#AF4034"> *</font></label><br/>
            </div>
            <div>
              <input type="text" name="sample4_postcode" id="sample4_postcode" placeholder="우편번호" readonly>
              <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            </div>
            <div> 
              <input type="text" name="sample4_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" required>
              <input type="text"  name="sample4_extraAddress" id="sample4_extraAddress" placeholder="참고항목">
            </div>   
            <div>
            <input type="text" name ="sample4_detailAddress" id="sample4_detailAddress" placeholder="상세주소" required>
            </div> 
          <br/>
          <div> -->
            <div>
              <label for="infoopen"><b>이메일 수신</b><font size="2px" color="#AF4034"> *</font></label><br/>
            </div>
            <div>
              <input type="radio" name="alert" value="Y" checked >수신
              <input type="radio" name="alert" value="N">비수신 <br/><br/>
            </div>
          </div>
          <div>
            <input align="center" type="submit" value="가입하기" onclick="joinCheck()">
          </div>
          <br/>
          <div>
            <a href="<%=request.getContextPath() %>"><input type="button" value="메인화면"></a>
          </div>
      </form>
    </div> 
  </div> 
</body>
</html>