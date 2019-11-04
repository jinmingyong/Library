import com.dao.*;
import com.entity.BookBad;
import com.entity.BookInuse;
import com.entity.BookRes;
import com.service.IBookResService;
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
    IBookResService bookResService;
  @org.junit.Test
    public void test(){
      readerMapper.readerlogin("1","1");
    }
}
