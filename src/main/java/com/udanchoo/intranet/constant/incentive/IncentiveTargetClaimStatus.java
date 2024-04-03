package com.udanchoo.intranet.constant.incentive;

public enum IncentiveTargetClaimStatus {
	APPROVED(234),
	REJECTED(235),
	PARTIALLYAPPROVED(236),
	CLAIMED(233);

	private final int code;
	
	IncentiveTargetClaimStatus(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

    // Optional: Get Status enum based on code
    public static IncentiveTargetClaimStatus getStatusByCode(int code) {
        for (IncentiveTargetClaimStatus status : IncentiveTargetClaimStatus.values()) {
            if (status.getCode() == code) {
                return status;
            }
        }
        throw new IllegalArgumentException("Invalid status code: " + code);
    }
	
}


