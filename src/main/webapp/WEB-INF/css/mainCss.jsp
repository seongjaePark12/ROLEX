<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	/* nav 반응형 작업 */
	@media all and (min-width: 1281px) {
	  #nav{
	    position: fixed; z-index: 99; width: 100%; background: linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0)); display: table;
	  }
	  #nav a, button{
	    font-size: 18px;
	  }
	  #SearchDiv{
	    width: 70%; background-color: white; border-bottom: 1px solid rgba(180,180,180); border-left: 1px solid rgba(180,180,180); height: auto; display: none; position: fixed; z-index: 100; right: 0; margin-top: 9%;
	  }
	  .font1{
	    font-weight: bolder;
	    font-size: 30pt;
	  }
	  .font2{
	    font-size: 20pt;
	  }
	  .font3{
	    font-weight: bolder;
	    font-size: 20pt;
	  }
	  .font4{
	    font-size: 20pt;
	  }
	  .font5{
	    font-weight: bolder;
	    font-size: 15pt;
	  }
	  .font6{
	    font-size: 15pt;
	  }
	  .font7{
	    font-size: 10pt;
	    font-weight: bolder;
	  }
	}
	@media all and (min-width: 1025px) and (max-width: 1280px) {
	  #nav{
	    position: fixed; z-index: 99; width: 100%; background: linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0)); display: table;
	  }
	  #nav a, button{
	    font-size: 15px;
	  }
	  #SearchDiv{
	    width: 70%; background-color: white; border-bottom: 1px solid rgba(180,180,180); border-left: 1px solid rgba(180,180,180); height: auto; display: none; position: fixed; z-index: 100; right: 0;margin-top: 9%;
	  }
	  .font1{
	    font-weight: bolder;
	    font-size: 25pt;
	  }
	  .font2{
	    font-size: 15pt;
	  }
	  .font3{
	    font-weight: bolder;
	    font-size: 15pt;
	  }
	  .font4{
	    font-size: 15pt;
	  }
	  .font5{
	    font-weight: bolder;
	    font-size: 10pt;
	  }
	  .font6{
	    font-size: 10pt;
	  }
	  .font7{
	    font-size: 8pt;
	    font-weight: bolder;
	  }
	}
	@media all and (min-width: 769px) and (max-width: 1024px) {
	  #nav{
	    position: fixed; z-index: 99; width: 100%; background: linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0)); display: table;
	  }
	  #nav a, button{
	    font-size: 12px;
	  }
	  #SearchDiv{
	    width: 70%; background-color: white; border-bottom: 1px solid rgba(180,180,180); border-left: 1px solid rgba(180,180,180); height: auto; display: none; position: fixed; z-index: 100; right: 0;margin-top: 9%;
	  }
	  .font1{
	    font-weight: bolder;
	    font-size: 20pt;
	  }
	  .font2{
	    font-size: 10pt;
	  }
	  .font3{
	    font-weight: bolder;
	    font-size: 10pt;
	  }
	  .font4{
	    font-size: 10pt;
	  }
	  .font5{
	    font-weight: bolder;
	    font-size: 8pt;
	  }
	  .font6{
	    font-size: 8pt;
	  }
	  .font7{
	    font-size: 6pt;
	    font-weight: bolder;
	  }
	}
	@media all and (max-width: 768px) {
	  #nav{
	    position: fixed; z-index: 99; width: 100%; background: linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0)); display: table;
	  } 
	  #nav a, button{
	    font-size: 7px;
	  }
	  #Topright{
	    position: relative;
	    top: 5px;
	  }
	  #Topleft{
	    position: relative;
	    top: 5px;
	  }
	  #SearchDiv{
	    width: 100%; background-color: white; border-bottom: 1px solid rgba(180,180,180); height: auto; display: none; position: fixed; z-index: 100; right: 0;margin-top: 9%;
	  }
	  .font1{
	    font-weight: bolder;
	    font-size: 15pt;
	  }
	  .font2{
	    font-size: 5pt;
	  }
	  .font3{
	    font-weight: bolder;
	    font-size: 5pt;
	  }
	  .font4{
	    font-size: 5pt;
	  }
	  .font5{
	    font-weight: bolder;
	    font-size: 3pt;
	  }
	  .font6{
	    font-size: 3pt;
	  }
	  .font7{
	    font-size: 3pt;
	    font-weight: bolder;
	  }
	  
	}
	@media all and (max-width: 600px){
	  .menu3{
	    background-color: black;
	  }
	}

	/* 기본 */
	body {
	  font-family: "Lato", sans-serif
	}
	#footerWidth #footer{
	  text-align: center;
	}
	#nav{
	  background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(255, 255, 255, 0));
	}
	#nav1{
	  background-color: black;
	}
	#nav a{
	  color: rgba(230,230,230);
	}
	#nav a:hover{
	  text-decoration: none;
	  color: slategrey;
	}
	.navDiv1{
	  /* font-size: 12px; */
	  font-weight: bold;
	  display: flex;
	}
	#home{
	  color: white;
	}
	.phone{
	  color: rgba(230,230,230);
	}
	.phone i{
	  color: gray;
	}
	.phone:hover, .phone:hover i{
	  color: white;
	}
	#nav:hover .navDiv1{
	  background-color: black;
	  opacity: 100%;
	}
	.btnSearch{
	  background-color: rgba(0,0,0,0);
	  border: none;
	  color: rgba(230,230,230);
	}
	div{
	  padding: 0px;
	  margin: 0px;
	}
	
	/* Footer 반응형 작업 */
	@media all and (min-width: 1281px) {
	  #footerWidth{
	    width: 100%; margin: 0 auto;
	  }
	  #footer{
	    list-style: none; text-align: left; font-size: 15px; color: gray;
	  }
	}
	
	@media all and (min-width: 769px) and (max-width: 1280px) {
	  #footerWidth{
	    width: 100%; margin: 0 auto;
	  }
	  #footer{
	    list-style: none; text-align: left; font-size: 12px; color: gray;
	  }
	}
	
	@media all and (max-width: 768px) {
	  #footerWidth{
	    width: 100%; margin: 0 auto;
	  }
	  #footer{
	    list-style: none; text-align: left; font-size: 10px; color: gray;
	  }
	}
</style>