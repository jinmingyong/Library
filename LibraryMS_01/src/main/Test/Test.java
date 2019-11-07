import com.dao.*;
import com.entity.BookBad;
import com.entity.BookInuse;
import com.entity.BookRes;
import com.entity.Comment;
import com.service.IBookInuseService;
import com.service.IBookResService;
import com.service.ICommentService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:beanxml.xml")
public class Test {
    @Autowired
    IBookResDao bookResDao;
    @Autowired
    BookBadMapper bookBadMapper;
    @Autowired
    BookInuseMapper bookInuseMapper;
    @Autowired
    BorrowMapper borrowMapper;
    @Autowired
    BtypeMapper btypeMapper;
    @Autowired
    ChatMapper chatMapper;
    @Autowired
    CommentMapper commentMapper;
    @Autowired
    PenaltyMapper penaltyMapper;
    @Autowired
    ReaderMapper readerMapper;
    @Autowired
    RemarkMapper remarkMapper;
    @Autowired
    IBookResService bookResService;
    @Autowired
    IBookInuseService bookInuseService;
    @Autowired
    ICommentService commentService;
  @org.junit.Test
    public void test(){
      Comment comment=new Comment();
      comment.setImage("11111111");
      comment.setContext("2222222");
      System.out.println(commentMapper.insertSelective(comment));

    }
}
