package com.stanley.vote.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.Preparable;
import com.stanley.common.action.JITActionBase;
import com.stanley.common.exception.JTException;
import com.stanley.common.util.StringUtil;
import com.stanley.vote.domain.Candidate;
import com.stanley.vote.domain.Ticket;
import com.stanley.vote.domain.Vote;
import com.stanley.vote.service.VoteService;

public class VoteResultTableAction extends JITActionBase implements Preparable {
	private Vote vote;
	private VoteService service;

	private List<String> candidateList;
	private List<String> ipList;
	private Map<String, Map<String, Ticket>> candidateMap;
	

	public void prepare() throws JTException {
		if (service == null) {
			service = (VoteService) this.getService("voteService");
		}
		if (vote != null && !StringUtil.isEmpty(vote.getId())) {
			vote = (Vote) service.findBoById(Vote.class, vote.getId());
		}
	}

	public String list() throws JTException {
		List canlist = service.queryByHql("from Candidate c where c.vote.id='" + vote.getId() + "' order by c.agreementNumber desc");
		candidateList = new ArrayList<String>();
		for (Object o : canlist) {
			Candidate c = (Candidate) o;
			candidateList.add(c.getName());
		}

		List tlist = service.queryByHql("from Ticket t where t.candidate.vote.id='" + vote.getId() + "'");
		candidateMap = new HashMap<String, Map<String, Ticket>>();
		Set<String> ipSet = new HashSet<String>();
		for (Object o : tlist) {
			Ticket ticket = (Ticket) o;
			Candidate candidate = ticket.getCandidate();
			Map<String, Ticket> ipMap = candidateMap.get(candidate.getName());
			if (ipMap == null) {
				ipMap = new HashMap<String, Ticket>();
			}
			ipMap.put(ticket.getVoterIp(), ticket);
			candidateMap.put(candidate.getName(), ipMap);
			ipSet.add(ticket.getVoterIp());
		}
		
		ipList = new ArrayList<String>();
		for(String ip:ipSet){
			ipList.add(ip);
		}
		return SUCCESS;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}


	public List<String> getCandidateList() {
		return candidateList;
	}

	public void setCandidateList(List<String> candidateList) {
		this.candidateList = candidateList;
	}

	public List<String> getIpList() {
		return ipList;
	}

	public void setIpList(List<String> ipList) {
		this.ipList = ipList;
	}

	public Map<String, Map<String, Ticket>> getCandidateMap() {
		return candidateMap;
	}

	public void setCandidateMap(Map<String, Map<String, Ticket>> candidateMap) {
		this.candidateMap = candidateMap;
	}


}
