package vo;

public class SimpleVO {
	private int idx;
	private String title;
	private String content;
	private String what;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWhat() {
		return what;
	}
	public void setWhat(String what) {
		this.what = what;
	}
	@Override
	public String toString() {
		return "SimpleVO [idx=" + idx + ", title=" + title + ", content=" + content + ", what=" + what + "]";
	}
	
	
	
}
