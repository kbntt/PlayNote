package kr.pe.playnote.com;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.pe.playnote.dto.MemberDto;

public interface ComService {
	public List<MemberDto> list(HashMap<String, Object> paramMap);
	public MemberDto detail(HashMap<String, Object> paramMap);
	public MemberDto loginChk(HashMap<String, Object> paramMap);
	public MemberDto emailDuplicateCheck(HashMap<String, Object> paramMap);
	public int memberSave(MemberDto dto);
	public boolean sessionChk(HttpServletRequest request);
	
	
}
