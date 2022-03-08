package kr.pe.playnote.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import kr.pe.playnote.dto.MemberDto;

public interface AdminService {

	public HashMap<String, Object> adminLoginChk(HttpServletRequest request,Locale locale);
	public HashMap<String, Object> loginDetail( HttpServletRequest request, HashMap<String, Object> paramMap, MemberDto dto, Locale locale  );
	public List<MemberDto> getMemberList(HttpServletRequest request);
	
}
