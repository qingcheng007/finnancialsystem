package com.ztyj6.fs.dao;

import com.ztyj6.fs.model.PenaltyRate;

public interface PenaltyRateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PenaltyRate record);

    int insertSelective(PenaltyRate record);

    PenaltyRate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PenaltyRate record);

    int updateByPrimaryKey(PenaltyRate record);
}