package recipe.model;

import java.util.Date;

public class MagaBean {
	private int maga_num;
	private String subject;
	private String readcount;
	private String recom;
	private String content;
	private String mfile;
	private Date mdate;
	private String state; // 0 삭제, 1 존재

	public int getMaga_num() {
		return maga_num;
	}

	public void setMaga_num(int maga_num) {
		this.maga_num = maga_num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public String getRecom() {
		return recom;
	}

	public void setRecom(String recom) {
		this.recom = recom;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMfile() {
		return mfile;
	}

	public void setMfile(String mfile) {
		this.mfile = mfile;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
