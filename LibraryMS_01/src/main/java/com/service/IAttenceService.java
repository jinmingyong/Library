package com.service;


import com.entity.Attence;

import java.util.Date;
import java.util.List;

public interface IAttenceService {
    int insert(Attence attence);

    int selectAttenceCount(int sId, Date attenceTime, Date attenceTime2);

    List<Attence> selectAttence(int sId, Date attenceTime, Date attenceTime2);
}
