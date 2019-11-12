package com.dao;

import com.entity.Attence;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface AttenceMapper {

    int insert(Attence attence);

    int selectAttenceCount(@Param("sId") int sId, @Param("attenceTime") Date attenceTime, @Param("attenceTime2") Date attenceTime2);

    List<Attence> selectAttence(@Param("sId") int sId, @Param("attenceTime") Date attenceTime, @Param("attenceTime2") Date attenceTime2);
}
