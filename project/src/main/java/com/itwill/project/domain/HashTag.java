package com.itwill.project.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class HashTag {
	private Long post_id;
	private Long tag_id;
	private String tag_name;
}
