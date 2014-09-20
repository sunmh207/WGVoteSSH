package com.stanley.voter.action;

import java.util.ArrayList;

import com.stanley.common.action.JITActionBase;
import com.stanley.common.exception.JTException;
import com.stanley.common.util.DateUtil;

/**
 * 当前用户今天的投票
 * 
 * @author stanley.sun
 * 
 */
public class MyVoteAction extends JITActionBase {

	public String getListHQL(ArrayList<Object> params) throws JTException {
		String today = DateUtil.getCurrentDate();
		String hql = "select vote from Vote vote, Voter voter where voter.vote.id=vote.id " + " and voter.submitTime>='" + today + "' and voter.submitTime<='"
				+ today + " 23:59:59' " + " and voter.ip='" + request.getRemoteAddr() + "'" + " order by vote.startDate desc";
		return hql;
	}

}
