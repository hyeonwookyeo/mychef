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
	private String mailid;
	private String domain;
	private String phone1;
	private String phone2;
	private String phone3;
	private String zip;
	private String addr1;
	private String addr2;
	private String joindate;
	private String deldate;
	private int state; // 회원 1 탈퇴대기 0
	
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
	public String getMailid() {
		return mailid;
	}
	public String getDomain() {
		return domain;
	}
	public String getPhone1() {
		return phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public String getPhone3() {
		return phone3;
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
	public void setMailid(String email) {
		this.mailid = mailid;
	}
	public void setDomain(String email) {
		this.domain = domain;
	}
	public void setPhone1(String phone) {
		this.phone1 = phone1;
	}
	public void setPhone2(String phone) {
		this.phone2 = phone2;
	}
	public void setPhone3(String phone) {
		this.phone3 = phone3;
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

