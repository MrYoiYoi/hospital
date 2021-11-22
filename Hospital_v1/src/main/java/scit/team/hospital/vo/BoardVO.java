package scit.team.hospital.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int boardnum;
	private String userid;
	private String title;
	private String text;
	private int    hitcount;
	private String regdate;
	private String originalfile;
	private String savedfile;
	private int replycount;
}
