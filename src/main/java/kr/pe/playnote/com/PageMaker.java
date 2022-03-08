package kr.pe.playnote.com;


public class PageMaker {
    
    private int totalcount;//전체 페이지 갯수
    private int countlist;
    private int pagenum;//현재 페이지 번호
    private int contentnum;
    private int startPage;
    private int endPage;
    private boolean prev=false;
    private boolean next;
    private int currentblock;
    private int lastblock;
    private int blockNum = 5;//
    
    
    public boolean isPrev() {
        return prev;
    }
 
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
 
    public boolean isNext() {
        return next;
    }
 
    public void setNext(boolean next) {
        this.next = next;
    }
 
    public int getStartPage() {
        return startPage;
    }
 
    public void setStartPage(int currentblock) {
        this.startPage = (currentblock*blockNum)-4;
    }
 
    public int getEndPage() {
        return endPage;
    }
 
    public void setEndPage(int getlastblock,int getcurrentblock) {
        if (getlastblock==getcurrentblock) {
            this.endPage = calcpage(getTotalcount(),getContentnum());
        }
        else {
            this.endPage = getStartPage()+4;
        }
    }
    
 
    public int getCurrentblock() {
        return currentblock;
    }
 
    public void setCurrentblock(int pagenum) {
        this.currentblock = pagenum/blockNum;
        if (pagenum%blockNum>0) {
            this.currentblock++;
        }
    }
 
    public int getLastblock() {
        return lastblock;
    }
 
    public void setLastblock(int totalcount) {
        this.lastblock = totalcount / (blockNum*this.contentnum);
        if (totalcount%(blockNum*this.contentnum)>0) {
            this.lastblock++;
        }
    }
 
    public void prevnext(int cpagenum) {    	
    	//block 앞으로가기
        if ( getCurrentblock() == 1) {
            if(cpagenum <= blockNum) {
                setPrev(false);
            }else{
                setPrev(true);
            }
        } else {
            setPrev(true);
        }
        
        //block 뒤로가기
        if ( getLastblock()  >1 ) {
            if( getLastblock() == getCurrentblock()) {
                setNext(false);
            }else{
                setNext(true);
            }
        } else {
            setNext(false);
        }
    }
    public int calcpage(int totalcount,int contentnum) {
        int totalpage = totalcount/contentnum;
        if (totalcount % contentnum>0) {
            totalpage++;
        }
        if (totalpage<this.pagenum) {
            this.pagenum=totalpage;
        }
        return totalpage;
    }
 
    public int getTotalcount() {
        return totalcount;
    }
 
    public void setTotalcount(int totalcount) {
        this.totalcount = totalcount;
    }
    public int getCountlist() {
        return countlist;
    }
 
    public void setCountlist(int countlist) {
        this.countlist = countlist;
    }
 
    public int getPagenum() {
        return pagenum;
    }
 
    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }
 
    public int getContentnum() {
        return contentnum;
    }
 
    public void setContentnum(int contentnum) {
        this.contentnum = contentnum;
    }
}