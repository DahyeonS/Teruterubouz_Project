package com.myweb.status;

import java.util.List;

public interface StatusService {
	List<StatusDTO> getTemp();
	List<StatusDTO> getRain();
}
