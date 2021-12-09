package vo;

public class BookingVO {
	private int idx;
	private String mid;
	private String name;
	private String booDate;
	private String booTime;
	private String content;
	
//날짜형식 필드를 '문자'와 '숫자'로 저장시키기 위한 변수 선언
	private String wCdate;
	private int wNdate;
	
	//이전글/다음글을 위한 변수 선언
	private int preIdx;
	private int nextIdx;
	private String preTitle;
	private String nextTitle;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBooDate() {
		return booDate;
	}
	public void setBooDate(String booDate) {
		this.booDate = booDate;
	}
	public String getBooTime() {
		return booTime;
	}
	public void setBooTime(String booTime) {
		this.booTime = booTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getwCdate() {
		return wCdate;
	}
	public void setwCdate(String wCdate) {
		this.wCdate = wCdate;
	}
	public int getwNdate() {
		return wNdate;
	}
	public void setwNdate(int wNdate) {
		this.wNdate = wNdate;
	}
	public int getPreIdx() {
		return preIdx;
	}
	public void setPreIdx(int preIdx) {
		this.preIdx = preIdx;
	}
	public int getNextIdx() {
		return nextIdx;
	}
	public void setNextIdx(int nextIdx) {
		this.nextIdx = nextIdx;
	}
	public String getPreTitle() {
		return preTitle;
	}
	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	@Override
	public String toString() {
		return "BookingVO [idx=" + idx + ", mid=" + mid + ", name=" + name + ", booDate=" + booDate + ", booTime=" + booTime
				+ ", content=" + content + ", wCdate=" + wCdate + ", wNdate=" + wNdate + ", preIdx=" + preIdx + ", nextIdx="
				+ nextIdx + ", preTitle=" + preTitle + ", nextTitle=" + nextTitle + "]";
	}
	
	
}
