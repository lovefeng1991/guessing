package cn.edu.zjgsu.guess;

public class GuessBean {
	
	private int n;
	private long time;
	private int result;
	private long startTime;
	private int maxNum;
	private int minNum;
	private boolean isRight;
	
	public GuessBean() {
		this.n = 0;
		this.time = 0;
		this.result = (int)(Math.random() * 100 + 1);
		this.startTime = 0;
		this.maxNum = 100;
		this.minNum = 1;
		this.isRight = false;
	}
		
	public int getN() {
		return this.n;
	}
	
	public void setN(int num) {
		this.n = num;
	}
	
	public int getMaxNum() {
		return this.maxNum;
	}
	
	public void setMaxNum(int num) {
		this.maxNum = num;
	}
	
	public int getMinNum() {
		return this.minNum;
	}
	
	public void setMinNum(int num) {
		this.minNum = num;
	}
	
	public long getTime() {
		return this.time;
	}
	
	public void setTime(long time) {
		this.time = time;
	}
	
	public int getResult() {
		return this.result;
	}
	
	public void setResult() {
		this.result = (int)(Math.random() * 100 + 1);
	}
	
	public long getStartTime() {
		return this.startTime;
	}
	
	public void setStartTime(long time) {
		this.startTime = time;
	}
	
	public boolean getIsRight() {
		return this.isRight;
	}
	
	public void setIsRight(boolean isRight) {
		this.isRight = isRight;
	}
	
	public void countTime() {
		if (this.startTime == 0) {
			this.startTime = System.currentTimeMillis(); 
		} else {
			this.time = (System.currentTimeMillis() - this.startTime) / 1000;
		}
	}
}
