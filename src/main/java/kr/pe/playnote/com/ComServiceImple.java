package kr.pe.playnote.com;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.playnote.dto.MemberDto;

@Service
public class ComServiceImple implements ComService{

	@Autowired
	private SqlSession sqlSession;
	private String namespace = "kr.pe.playnote.com.dao.IMemberdDao";

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 첨부파일 멤버저장
     * */
	@Override
    public int memberSave(MemberDto dto) {
		
		String sqlId = ".memberSave";
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(dto).getSql();
		System.out.println("==== memberSave ====");
	    System.out.println(sql);
	    int result = sqlSession.insert(namespace+sqlId, dto);
		 
       return result;
    }
	
    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 이메일중복체크
     * */
	@Override
    public MemberDto emailDuplicateCheck(HashMap<String, Object> paramMap) {
		
		String sqlId = ".emailDuplicateCheck";
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		System.out.println("==== emailDuplicateCheck ====");
	    System.out.println(sql);
	    MemberDto dto = sqlSession.selectOne(namespace+sqlId, paramMap);
		 
       return dto;
    }
	
    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 멤버 리스트
     * */
	@Override
    public List<MemberDto> list( HashMap<String, Object> paramMap ) {
		
		
		 String sqlId = ".listDao";
		 String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		 System.out.println("==== list ====");
	     System.out.println(sql);
	        
		 List<MemberDto> dto = sqlSession.selectList(namespace+sqlId, paramMap);
		 
        return dto;
    }

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 멤버 상세
     * */
	@Override
    public MemberDto detail(HashMap<String, Object> paramMap) {
		
		String sqlId = ".detail";
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		System.out.println("==== detail ====");
	    System.out.println(sql);
	    MemberDto dto = sqlSession.selectOne(namespace+sqlId, paramMap);
		 
       return dto;
    }

    /* 작성일 : 2021-07-06 
     * 작성자 : 이응규
     * 로그인 체크
     * */
	@Override
    public MemberDto loginChk(HashMap<String, Object> paramMap) {
		
		String sqlId = ".loginChk";
		String sql = sqlSession.getConfiguration().getMappedStatement(namespace+sqlId).getBoundSql(paramMap).getSql();
		System.out.println("==== loginChk ====");
	    System.out.println(sql);
	    MemberDto dto = sqlSession.selectOne(namespace+sqlId, paramMap);
		 
       return dto;
    }

    /* 작성일 : 2021-08-04
     * 작성자 : 이응규
     * 세션체크
     * */
	@Override
    public boolean sessionChk( HttpServletRequest request ) {
		
    	boolean result = false;
    	
		HttpSession session = request.getSession(true);
		MemberDto memberDto = (MemberDto)session.getAttribute(Code.SESSION_INFO);
		if( memberDto != null) {
			result = true;
		}
        return result;
        
    }
}
