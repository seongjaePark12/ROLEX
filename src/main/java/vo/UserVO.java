package vo;

public class UserVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String birth;
	private String email;
	private String getCode;
	private String address;
	private String emailInfor;
	private String userDel;
	private int point;
	private int level;
	private int visitCnt;
	private String startDate;
	private String lastDate;
	private int todayCnt;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGetCode() {
		return getCode;
	}
	public void setGetCode(String getCode) {
		this.getCode = getCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmailInfor() {
		return emailInfor;
	}
	public void setEmailInfor(String emailInfor) {
		this.emailInfor = emailInfor;
	}
	public String getUserDel() {
		return userDel;
	}
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getVisitCnt() {
		return visitCnt;
	}
	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getTodayCnt() {
		return todayCnt;
	}
	public void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}
	@Override
	public String toString() {
		return "UserVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth + ", email="
				+ email + ", getCode=" + getCode + ", address=" + address + ", emailInfor=" + emailInfor + ", userDel="
				+ userDel + ", point=" + point + ", level=" + level + ", visitCnt=" + visitCnt + ", startDate=" + startDate
				+ ", lastDate=" + lastDate + ", todayCnt=" + todayCnt + "]";
	}
}