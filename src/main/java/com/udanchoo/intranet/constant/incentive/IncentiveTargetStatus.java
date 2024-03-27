package com.udanchoo.intranet.constant.incentive;

public enum IncentiveTargetStatus {
	APPROVED(234),
	REJECTED(235),
	PARTIALLYAPPROVED(236),
	CLAIMED(233);

	private final int code;
	
	IncentiveTargetStatus(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

    // Optional: Get Status enum based on code
    public static IncentiveTargetStatus getStatusByCode(int code) {
        for (IncentiveTargetStatus status : IncentiveTargetStatus.values()) {
            if (status.getCode() == code) {
                return status;
            }
        }
        throw new IllegalArgumentException("Invalid status code: " + code);
    }
	
}


