package vo;

public class QuestionVO {
	private int idx;
	private String name;
	private String title;
	private String vDate;
	private int vCount;
	private String content;

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getvDate() {
		return vDate;
	}
	public void setvDate(String vDate) {
		this.vDate = vDate;
	}
	public int getvCount() {
		return vCount;
	}
	public void setvCount(int vCount) {
		this.vCount = vCount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "QuestionVO [idx=" + idx + ", name=" + name + ", title=" + title + ", vDate=" + vDate + ", vCount=" + vCount
				+ ", content=" + content + "]";
	}
	
	
}
