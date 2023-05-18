package recipe.model;

import java.util.Date;

public class Board {

	private int ann_Num;
	private String subject; // 글제목
	private String content; // 글내용
	private int readCount; // 조회수
	private String aFile; // 첨부파일
	private Date aDate; // 글 등록날짜
	private String state;
	
	public int getAnn_Num() {
		return ann_Num;
	}
	public void setAnn_Num(int ann_Num) {
		this.ann_Num = ann_Num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getaFile() {
		return aFile;
	}
	public void setaFile(String aFile) {
		this.aFile = aFile;
	}
	public Date getaDate() {
		return aDate;
	}
	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}


	
	
	

}
