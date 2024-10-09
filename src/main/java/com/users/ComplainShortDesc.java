
package com.users;

public class ComplainShortDesc {
	private String cust_id;
	private String complain_id;
	private String complaint_type;
	private String status;
	private String problem_desc;
	
	public ComplainShortDesc(String cust_id, String complain_id, String complaint_type,
			String problem_desc,String status) {
		super();
		this.cust_id = cust_id;
		this.complain_id = complain_id;
		this.complaint_type = complaint_type;
		
		this.problem_desc = problem_desc;
		this.status = status;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getComplain_id() {
		return complain_id;
	}
	public void setComplain_id(String complain_id) {
		this.complain_id = complain_id;
	}
	public String getComplaint_type() {
		return complaint_type;
	}
	public void setComplaint_type(String complaint_type) {
		this.complaint_type = complaint_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProblem_desc() {
		return problem_desc;
	}
	public void setProblem_desc(String problem_desc) {
		this.problem_desc = problem_desc;
	}
	
	
	
}
