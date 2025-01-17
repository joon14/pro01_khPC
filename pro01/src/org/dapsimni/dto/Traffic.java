package org.dapsimni.dto;

public class Traffic {
	private int tno;
	private String ttype;
	private String no;
	private String route;
	private String comment;
	
	public Traffic() {}
	public Traffic(int tno, String ttype, String no, String route, String comment) {
		super();
		this.tno = tno;
		this.ttype = ttype;
		this.no = no;
		this.route = route;
		this.comment = comment;
	}
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTtype() {
		return ttype;
	}
	public void setTtype(String ttype) {
		this.ttype = ttype;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Override
	public String toString() {
		return "Traffic [tno=" + tno + ", ttype=" + ttype + ", no=" + no + ", route=" + route + ", comment=" + comment
				+ "]";
	}
}
