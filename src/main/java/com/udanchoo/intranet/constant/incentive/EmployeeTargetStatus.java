package com.udanchoo.intranet.constant.incentive;

public enum EmployeeTargetStatus {
	PENDING(237),
	SUCCESS(238),
	FAILED(239),
	PAID(240);

	private final int code;
	
	EmployeeTargetStatus(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

    // Optional: Get Status enum based on code
    public static EmployeeTargetStatus getStatusByCode(int code) {
        for (EmployeeTargetStatus status : EmployeeTargetStatus.values()) {
            if (status.getCode() == code) {
                return status;
            }
        }
        throw new IllegalArgumentException("Invalid status code: " + code);
    }
	
}


