package com.th.entity;


public class Major {
    private Integer mid;
    private String mname;
    private Integer credit;
    private Integer lifeYear;
    private String introduction;
    private Integer cid;
    private String cname;
    public Major(){}
    public Major(String mname, Integer credit, Integer lifeYear, String introduction, Integer cid) {
        this.mname = mname;
        this.credit = credit;
        this.lifeYear = lifeYear;
        this.introduction = introduction;
        this.cid = cid;
    }

    public Major(Integer mid, String mname, Integer credit, Integer lifeYear, String introduction, Integer cid) {
        this.mid = mid;
        this.mname = mname;
        this.credit = credit;
        this.lifeYear = lifeYear;
        this.introduction = introduction;
        this.cid = cid;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Integer getLifeYear() {
        return lifeYear;
    }

    public void setLifeYear(Integer lifeYear) {
        this.lifeYear = lifeYear;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String toString() {
        return "Major{" +
                "mid=" + mid +
                ", mname='" + mname + '\'' +
                ", credit=" + credit +
                ", liftYear=" + lifeYear +
                ", introduction='" + introduction + '\'' +
                ", cid=" + cid +
                '}';
    }
}
