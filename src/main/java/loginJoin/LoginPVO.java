package loginJoin;

public class LoginPVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String getCode;
	private String lastDate;
	private int vCount;
	private int point;
	
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getvCount() {
		return vCount;
	}
	public void setvCount(int vCount) {
		this.vCount = vCount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "LoginPVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", email=" + email + ", getCode=" + getCode + ", lastDate=" + lastDate + ", vCount="
				+ vCount + ", point=" + point + "]";
	}
	
	
}
