package recipe.model;

import java.sql.Timestamp;

public class BoardDTO {
	private int comm_num;
	private String id;
	private String subject;
	private String readcount;
	private String content;
	private String commfile;
	private Timestamp cdate;
	private String state; // 0 삭제, 1 존재

	// 검색
	private String search;
	private String keyword;

	// 페이지
	private int startRow;
	private int endRow;
	
	
	public int getComm_num() {
		return comm_num;
	}
	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCommfile() {
		return commfile;
	}
	public void setCommfile(String commfile) {
		this.commfile = commfile;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}



}
