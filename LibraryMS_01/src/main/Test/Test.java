import com.dao.*;
import com.entity.*;
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
      Chat chat=new Chat();
      chat.setPid((long) 1);
      System.out.println(chatMapper.insertSelective(chat));

    }
}
