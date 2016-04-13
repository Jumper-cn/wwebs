package com.jumper.wwebs.framework.exception;

public abstract class AbstractBaseException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1150918969143676990L;
	public AbstractBaseException() {
        super();
    }
	
	public AbstractBaseException(String message) {
        super(message);
    }
	
	public AbstractBaseException(String message, Throwable cause) {
        super(message, cause);
    }
	
	public AbstractBaseException(Throwable cause) {
        super(cause);
    }
}
