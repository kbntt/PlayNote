package kr.pe.playnote.main;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.playnote.admin.AdminController;
import kr.pe.playnote.dto.AttachFileDto;
import kr.pe.playnote.dto.BoardDto;

@Service
public class MainServiceImple implements MainService{
	
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "kr.pe.playnote.main.dao.IMainDao";
	

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 공지사항 리스트
     * */
	@Override
    public List<BoardDto> getBoardList( HashMap<String, Object> paramMap ) {
		
		
		 String sqlId = ".listDao";
		 String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		 System.out.println("==== getBoardList ====");
	     System.out.println(sql);
	        
		 List<BoardDto> dto = sqlSession.selectList(namespace+sqlId, paramMap);
		 
        return dto;
    }

    /* 작성일 : 2021-08-20
     * 작성자 : 이응규
     * 첨부파일 리스트
     * */
	@Override
    public List<AttachFileDto> getAttachFile( HashMap<String, Object> paramMap ) {
		
		
		 String sqlId = ".attachFile";
		 String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		 System.out.println("==== getAttachFile ====");
	     System.out.println(sql);
	        
		 List<AttachFileDto> dto = sqlSession.selectList(namespace+sqlId, paramMap);
		 
        return dto;
    }
	
    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 공지사항 페이지 리스트
     * */
	@Override
    public List<BoardDto> getPageList( HashMap<String, Object> paramMap ) {
		
		
		 String sqlId = ".pageListDao";
		 String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		 System.out.println("==== getPageList ====");
	     System.out.println(sql);
	        
		 List<BoardDto> dto = sqlSession.selectList(namespace+sqlId, paramMap);
		 
        return dto;
    }

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 게시판 Total Count
     * */
	@Override
    public List<BoardDto> getTotalCount(HashMap<String, Object> paramMap) {
		
		String sqlId = ".totalCountDao";
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		System.out.println("==== getTotalCount ====");
	    System.out.println(sql);
	        
		 List<BoardDto> dto = sqlSession.selectList(namespace+sqlId, paramMap);
		 
       return dto;
    }

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 공지사항 상세
     * */
	@Override
    public BoardDto getNoticeDetail(HashMap<String, Object> paramMap) {
		
		String sqlId = ".noticeDetail";
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		System.out.println("==== getNoticeDetail ====");
	    System.out.println(sql);
		 BoardDto dto = sqlSession.selectOne(namespace+sqlId, paramMap);
		 
       return dto;
    }

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 게시판 삭제
     * */
	@Override
    public int deleteList(HashMap<String, List<String>> paramMap) {

		HashMap<String, String> hm = new HashMap<String, String>();
		int result = 0;
		List<String> list = paramMap.get("list");
		for(int i = 0; i < list.size(); i++){
	        String uuid = list.get(i);
	        hm.put("UUID", uuid);
	        String sqlId = ".deleteList";
			String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(hm).getSql();
			System.out.println("==== deleteList ====");
		    System.out.println(sql);
			result = sqlSession.delete(namespace+sqlId, hm);
			System.out.println("==== result["+result+"] ====");
			
	    }
        return result;
    }
	
    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 첨부파일 저장
     * */
	@Override
    public int insertAttachFile(HashMap<String, AttachFileDto> paramMap) {

		String sqlId = ".insertAttachFile";
		int result = 0;
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		logger.info("insertAttachFilee - " + sql);
		result = sqlSession.insert(namespace+sqlId, paramMap);
        return result;
    }

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 게시판 저장
     * */
	@Override
    public int insertBoard(HashMap<String, BoardDto> paramMap) {

		String sqlId = ".insertBoard";
		int result = 0;
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		logger.info("insertBoard - " + sql);
		result = sqlSession.insert(namespace+sqlId, paramMap);
        return result;
    }
	
	
	@Override
    public List<BoardDto> getBoardListTest() {
		
		HashMap<String, Object> paramMap =  new HashMap<String, Object>();
		paramMap.put("BOARD_CODE", "1");
        String sqlId = ".listDao";
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		List<BoardDto> dto = sqlSession.selectList(namespace+sqlId, paramMap);
        System.out.println("==== getBoardListTest getBoardListTest ====");
        System.out.println(sql);
        
        return dto;
    }

    /* 작성일 : 2021-04-03
     * 작성자 : 이응규
     * 게시판 수정
     * */
	@Override
    public int updateBoard(HashMap<String, Object> paramMap) {
		

		String sqlId = ".updateBoard";
		int result = 0;
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		logger.info("updateBoard - " + sql);
		result = sqlSession.insert(namespace+sqlId, paramMap);
        return result;
        
    }
	
    /* 작성일 : 2021-08-03
     * 작성자 : 이응규
     * 조회수 수정
     * */
	@Override
    public int updateHits(HashMap<String, Object> paramMap) {
		

		String sqlId = ".updateHits";
		int result = 0;
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		logger.info("updateBoard - " + sql);
		result = sqlSession.insert(namespace+sqlId, paramMap);
        return result;
        
    }
	
	

}










