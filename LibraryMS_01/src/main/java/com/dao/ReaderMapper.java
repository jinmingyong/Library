package com.dao;

import com.entity.Reader;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface ReaderMapper  {
    int deleteByPrimaryKey(Long readId);

    int insert(Reader record);

    int insertSelective(Reader record);

    Reader selectByPrimaryKey(Long readId);

    Reader readerlogin(@Param("rname") String username, @Param("rpwd")String pwd);

    List<Reader> selectAllReader();

    int updateByPrimaryKeySelective(Reader record);

    int updateByPrimaryKey(Reader record);



    //吴原荣
    /**
     * 查询所有用户
     * @return
     */
    List<Reader> findReaderAll();

    /**
     * 保存用户
     * @param reader
     */
    //@Insert("insert into user(s_name,s_password,s_email,phoneNum,s_sex) values(#{s_name},#{s_password},#{s_email},#{phoneNum},#{s_sex})")
    void saveReader(Reader reader);

    /**
     * 修改用户信息
     * @param reader
     */
    //@Update("update user set s_name=#{s_name},s_password=#{s_password},s_email=#{s_email},phoneNum=#{phoneNum},s_sex=#{s_sex} where s_id=#{s_id}")
    void updateReader(Reader reader);

    /**
     * 删除用户
     * @param id
     */
    //@Delete("delete from user where s_id=#{id}")
    void deleteReader(Integer id);
    //@Select("select * from user where s_name=#{name}")
    List<Reader> findByName(String name);
    //@Select("select * from user where ((s_id =#{name} or phoneNum={name}) or s_email=#{name}) and s_password=#{password}")
    List<Reader> findLogin(Reader reader);

    void updateReaderPassword(Reader reader);

    List<Reader> findByPhoneNum(String rphone);
}