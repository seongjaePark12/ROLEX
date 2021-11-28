package vo;

public class ReplyQuestionVO {
	private int idx;
	private int questionIdx;
	private String mid;
	private String wDate;
	private String hostIp;
	private String content;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getQuestionIdx() {
		return questionIdx;
	}
	public void setQuestionIdx(int questionIdx) {
		this.questionIdx = questionIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ReplyNoticeVO [idx=" + idx + ", questionIdx=" + questionIdx + ", mid=" + mid + ", wDate=" + wDate
				+ ", hostIp=" + hostIp + ", content=" + content + "]";
	}
	

}
