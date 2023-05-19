package recipe.model;

import java.sql.Timestamp;

public class ReplyBoardDTO {
	private int commre_num;
	private int comm_num;
	private String id;
	private String re_content;
	private Timestamp re_date;
	private String state;
	private String ref;
	private String ref_seq;
	private String ref_lev;
	public int getCommre_num() {
		return commre_num;
	}
	public void setCommre_num(int commre_num) {
		this.commre_num = commre_num;
	}
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
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getRef_seq() {
		return ref_seq;
	}
	public void setRef_seq(String ref_seq) {
		this.ref_seq = ref_seq;
	}
	public String getRef_lev() {
		return ref_lev;
	}
	public void setRef_lev(String ref_lev) {
		this.ref_lev = ref_lev;
	}

}