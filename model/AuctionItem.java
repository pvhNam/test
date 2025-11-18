package model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class AuctionItem {
    private Long id;
    private String description;
    private double initialPrice;
    private double priceStep;
    private double currentPrice;
    private Calendar startDate;
    private Calendar endDate;
    private List<Bid> bids = new ArrayList<>();

    public AuctionItem(Long id, String description, double initialPrice, double priceStep) {
        this.id = id;
        this.description = description;
        this.initialPrice = initialPrice;
        this.priceStep = priceStep;
        this.currentPrice = initialPrice;
        
        // Giả lập ngày giờ
        this.startDate = Calendar.getInstance();
        this.startDate.add(Calendar.DAY_OF_MONTH, -1);
        this.endDate = Calendar.getInstance();
        this.endDate.add(Calendar.DAY_OF_MONTH, 2);
    }

    // --- CÁC HÀM GETTER (BẮT BUỘC PHẢI CÓ ĐỂ JSP KHÔNG BỊ LỖI) ---

    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public double getInitialPrice() {
        return initialPrice;
    }

    public double getCurrentPrice() {
        return currentPrice;
    }

    public double getPriceStep() {
        return priceStep;
    }
    
    public List<Bid> getBids() {
        return bids;
    }

    // Hàm này sửa lỗi dòng 48 (Thời gian còn lại)
    public String getDuration() {
        long now = System.currentTimeMillis();
        long end = endDate.getTimeInMillis();
        long diff = end - now;

        if (diff <= 0) return "Đã kết thúc";

        long days = diff / (24 * 60 * 60 * 1000);
        long hours = (diff / (60 * 60 * 1000)) % 24;
        long minutes = (diff / (60 * 1000)) % 60;

        return days + " ngày " + hours + " giờ " + minutes + " phút";
    }

    public void addBid(Bid bid) {
        this.bids.add(bid);
        this.currentPrice = bid.getAmount();
    }
}