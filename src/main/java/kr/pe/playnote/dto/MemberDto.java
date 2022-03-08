package kr.pe.playnote.dto;


public class MemberDto {
    private String uuid              ;
    private String email             ;
    private String password          ;
    private String username          ;
    private String nickname          ;
    private String phone             ;
    private String emailCert         ;
    private String registerDatetime  ;
    private String lastloginDatetime ;
    private String lastloginIp       ;
    private String auth       ;   
    private String authName       ;
	private String deleteYn       ;
    private String adminmemo         ;
    private String createDatetime    ;
    private String createDatetimeStr    ;
	private String createUser        ;
    private String updateDatetime    ;
    private String updateUser        ;
    private String loginChk        ;
    private String emailChk        ;
	private int rnum;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
    public String getCreateDatetimeStr() {
		return createDatetimeStr;
	}
	public void setCreateDatetimeStr(String createDatetimeStr) {
		this.createDatetimeStr = createDatetimeStr;
	}
    public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getLoginChk() {
		return loginChk;
	}
	public void setLoginChk(String loginChk) {
		this.loginChk = loginChk;
	}
	public String getEmailChk() {
		return emailChk;
	}
	public void setEmailChk(String emailChk) {
		this.emailChk = emailChk;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmailCert() {
		return emailCert;
	}
	public void setEmailCert(String emailCert) {
		this.emailCert = emailCert;
	}
	public String getRegisterDatetime() {
		return registerDatetime;
	}
	public void setRegisterDatetime(String registerDatetime) {
		this.registerDatetime = registerDatetime;
	}
	public String getLastloginDatetime() {
		return lastloginDatetime;
	}
	public void setLastloginDatetime(String lastloginDatetime) {
		this.lastloginDatetime = lastloginDatetime;
	}
	public String getLastloginIp() {
		return lastloginIp;
	}
	public void setLastloginIp(String lastloginIp) {
		this.lastloginIp = lastloginIp;
	}
	public String getAdminmemo() {
		return adminmemo;
	}
	public void setAdminmemo(String adminmemo) {
		this.adminmemo = adminmemo;
	}
	public String getCreateDatetime() {
		return createDatetime;
	}
	public void setCreateDatetime(String createDatetime) {
		this.createDatetime = createDatetime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getUpdateDatetime() {
		return updateDatetime;
	}
	public void setUpdateDatetime(String updateDatetime) {
		this.updateDatetime = updateDatetime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
}

