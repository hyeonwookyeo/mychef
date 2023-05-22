package recipe.model;

import java.sql.Timestamp;

public class ReplyMagaBean {
	private int magare_num;
	private int maga_num;
	private String id;
	private String re_content;
	private Timestamp re_date;
	private String state;
	private String ref;
	private String ref_seq;
	private String ref_lev;
	private String profile;

	public int getMagare_num() {
		return magare_num;
	}

	public void setMagare_num(int magare_num) {
		this.magare_num = magare_num;
	}

	public int getMaga_num() {
		return maga_num;
	}

	public void setMaga_num(int maga_num) {
		this.maga_num = maga_num;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
}
