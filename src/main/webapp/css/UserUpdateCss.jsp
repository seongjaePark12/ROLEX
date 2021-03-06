<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
a { /* a 태그 style 설정 */
  text-align: center;
  text-decoration: none; /* 링크의 밑줄 제거 */
  color: inherit; /* 링크의 색상 제거 */
}
body{
  margin: 0px;
  padding: 0px;
}
.row{
  background-color: white;
}
.row{
  background-color: white;
  border-radius: 30px;
  box-shadow: 12px 12px 22px gray;
}
#mid {
  width: 100%;
  height: 43px;
  margin-top: 11px;
  border: 1px solid #DADADA;
  outline: none;
}
#pwd {
  width: 100%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#pwdTest {
  width: 100%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#name {
  width: 100%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#birth{
  width: 100%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#email {
  width: 300px;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#email2 {
	margin-top: 10px;
  height: 43px;
  border: 1px solid #DADADA;
  outline: none;
}
#getCode {
  width: 130px;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#getCode2 {
  width: 130px;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#getCode3 {
  width: 130px;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}

input[type=button] {
  width: 94px;
  height: 43px;
  background-color: black;
  border-radius: 4px;
  font-weight: bold;
  border: 0;
  color: white;
}
input[type=button]:hover{
  background: white;
  border: 1px solid;
  color: black;
}
#setCode {
  width: 436px;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}

#joinbtn {
  width: 435px;
  height: 43px;
  background-color: black;
  border-radius: 4px;
  font-weight: bold;
  border: 0;
  color: white;
  font-size: 20px;
}
#joinbtn:hover{
  background: white;
  border: 1px solid;
  color: black;
}
input[type=button] {
  width: 90px;
  height: 43px;
  border: 0;
  font-size: 13px;
  background-color: black;
  color: white;
  border-radius: 4px;
  font-weight: bold;
}
#jojo{
  text-decoration: inherit;
  color: black;
}
#sample6_postcode {
  width: 50%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#sample6_address {
  width: 68.5%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#sample6_extraAddress {
  width: 30%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}
#sample6_detailAddress {
  width: 100%;
  height: 43px;
  margin-top: 10px;
  border: 1px solid #DADADA;
  outline: none;
}

label{
  position: relative;
  right: 205px;
  font-weight: bold;
}
label[for="pwd"]{
  position : relative;
  right : 200px;
}
label[for="pwdTest"]{
  position : relative;
  right : 180px;
}
label[for="name"]{
  position : relative;
  right : 215px;
}
label[for="birth"]{
  position : relative;
  right : 205px;
}
label[for="gender"]{
  position : relative;
  right : 215px;
}
label[for="email"]{
  position : relative;
  right : 205px;
}
label[for="emailCheck"]{
  position : relative;
  right : 143px;
}
label[for="phone"]{
  position : relative;
  right : 195px;
}
label[for="address"]{
  position : relative;
  right : 215px;
}
label[for="infoopen"]{
  position : relative;
  right : 190px;
}
</style>