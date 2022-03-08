package kr.pe.playnote.com;

import java.util.List;

import kr.pe.playnote.dto.MemberDto;

public interface IMemberDao {
	public List<MemberDto> list();
	public MemberDto detail();
	public MemberDto loginChk();
}
