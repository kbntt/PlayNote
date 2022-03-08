package kr.pe.playnote.main;

import java.util.HashMap;
import java.util.List;

import kr.pe.playnote.dto.AttachFileDto;
import kr.pe.playnote.dto.BoardDto;

public interface MainService {
	public List<BoardDto> getBoardList(HashMap<String, Object> paramMap);
	public List<BoardDto> getPageList(HashMap<String, Object> paramMap);
	public List<BoardDto> getTotalCount(HashMap<String, Object> paramMap);
	public BoardDto getNoticeDetail(HashMap<String, Object> paramMap);
	public List<AttachFileDto> getAttachFile(HashMap<String, Object> paramMap);
	public int deleteList(HashMap<String, List<String>> paramMap);
	public int insertAttachFile(HashMap<String, AttachFileDto> paramMap);
	public int insertBoard(HashMap<String, BoardDto> paramMap);//게시판 저장	
	public int updateBoard(HashMap<String, Object> paramMap);//게시판 수정
	public int updateHits(HashMap<String, Object> paramMap);//조회수 증가
	
	
	public List<BoardDto> getBoardListTest();
}
