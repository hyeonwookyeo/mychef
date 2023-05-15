package recipe.model;

import java.sql.Date;

public class RecipeReBoard {

	private int rre_num;
	private int rnum;
	private String id;
	private String re_content;
	private Date re_date;
	private String state;
	private String re_rfile;
	
	// page
	private int startRow;
	private int endRow;
	
	
	public int getRre_num() {
		return rre_num;
	}
	public void setRre_num(int rre_num) {
		this.rre_num = rre_num;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRe_rfile() {
		return re_rfile;
	}
	public void setRe_rfile(String re_rfile) {
		this.re_rfile = re_rfile;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
	
	
	
	
}
