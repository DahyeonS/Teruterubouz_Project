package com.myweb.status;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StatusDTO {
	private int date;
	private double avgTem, maxTem, minTem, avgRain, maxRain, hourRain;
}
