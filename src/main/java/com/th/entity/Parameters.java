package com.th.entity;

public class Parameters {
    private Integer cid;
    private String mname;
    private Integer minCredit;
    private Integer maxCredit;
    public Parameters(){};
    public Parameters(Integer cid, String mname, Integer minCredit, Integer maxCredit) {
        this.cid = cid;
        this.mname = mname;
        this.minCredit = minCredit;
        this.maxCredit = maxCredit;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Integer getMinCredit() {
        return minCredit;
    }

    public void setMinCredit(Integer minCredit) {
        this.minCredit = minCredit;
    }

    public Integer getMaxCredit() {
        return maxCredit;
    }

    public void setMaxCredit(Integer maxCredit) {
        this.maxCredit = maxCredit;
    }

    @Override
    public String toString() {
        return "Param{" +
                "cid=" + cid +
                ", mname='" + mname + '\'' +
                ", minCredit=" + minCredit +
                ", maxCredit=" + maxCredit +
                '}';
    }
}
