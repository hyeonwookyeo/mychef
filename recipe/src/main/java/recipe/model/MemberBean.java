package recipe.model;

public class MemberBean {

	private String id;
	private String nickname;
	private String pwd;
	private String pwd2;
	private String changepwd;
	private String name;
	private String birth;
	private String profile;
	private String email;
	private String domain;
	private String tel1;
	private String tel2;
	private String tel3;
	private String zip;
	private String addr1;
	private String addr2;
	private String joindate;
	private String deldate;
	private int state; // 가입대기 0 회원 1 탈퇴대기 2

	public String getId() {
		return id;
	}

	public String getNickname() {
		return nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public String getPwd2() {
		return pwd2;
	}

	public String getChangepwd() {
		return changepwd;
	}

	public String getName() {
		return name;
	}

	public String getBirth() {
		return birth;
	}

	public String getProfile() {
		return profile;
	}

	public String getEmail() {
		return email;
	}

	public String getDomain() {
		return domain;
	}

	public String getTel1() {
		return tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public String getZip() {
		return zip;
	}

	public String getAddr1() {
		return addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public String getJoindate() {
		return joindate;
	}

	public String getDeldate() {
		return deldate;
	}

	public int getState() {
		return state;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	
	public void setChangepwd(String changepwd) {
		this.changepwd = changepwd;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}

	public void setState(int state) {
		this.state = state;
	}

}