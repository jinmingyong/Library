package com.service.impl;

import com.dao.AttenceMapper;
import com.entity.Attence;
import com.service.IAttenceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("attenceService")
public class AttenceServiceimpl implements IAttenceService {
    @Resource
    private AttenceMapper attenceMapper;

    @Override
    public int insert(Attence attence) {
        return attenceMapper.insert(attence);
    }

    @Override
    public int selectAttenceCount(int sId, Date attenceTime, Date attenceTime2) {
        return attenceMapper.selectAttenceCount(sId,attenceTime,attenceTime2);
    }

    @Override
    public List<Attence> selectAttence(int sId, Date attenceTime, Date attenceTime2) {
        return attenceMapper.selectAttence(sId,attenceTime,attenceTime2);
    }

}
