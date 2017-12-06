package com.dto;

import java.util.Date;

public class MyDto {
	
	//번호seq, 작성자writer,
	//제목title, 내용 content, 작성일자regDate
	
	//insert 할 때(seq는 sequence로, regDate는 sysdate로)
	
	//update 할 때(writer는 나 자신이니까 필요 없음, regDate는 sysdate로)
	
	private int seq;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	
	public MyDto() {
		super();
	}

	//insert 할 때(seq는 sequence로, regDate는 sysdate로)
	public MyDto(String writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
	}
	
	//update 할 때(writer는 나 자신이니까 필요 없음, regDate는 sysdate로)
	public MyDto(int seq, String title, String content) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
	}

	public MyDto(int seq, String writer, String title, String content, Date regDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MyDto [seq=" + seq + ", writer=" + writer + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + "]";
	}

	

}
