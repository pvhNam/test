package model;

import java.util.Calendar;

public class Bid {
	private User bidder;
    private AuctionItem item;
    private double amount;
    private Calendar created;
	public Bid(User bidder, AuctionItem item, double amount, Calendar created) {
		super();
		this.bidder = bidder;
		this.item = item;
		this.amount = amount;
		this.created = created;
	}
	public User getBidder() {
		return bidder;
	}
	public double getAmount() {
		return amount;
	}
    
}
