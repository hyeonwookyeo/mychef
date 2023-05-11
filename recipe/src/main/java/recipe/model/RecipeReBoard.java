package recipe.model;

import java.sql.Date;

public class RecipeReBoard {

	private int rre_num;
	private int rnum;
	private String id;
	private String re_content;
	private Date re_date;
	private String state;
	private int ref;
	private int ref_seq;
	private int ref_lev;
	
	
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_seq() {
		return ref_seq;
	}
	public void setRef_seq(int ref_seq) {
		this.ref_seq = ref_seq;
	}
	public int getRef_lev() {
		return ref_lev;
	}
	public void setRef_lev(int ref_lev) {
		this.ref_lev = ref_lev;
	}
	
	
}
